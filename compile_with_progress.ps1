param(
    [string]$Platform = "windows",
    [string]$Target = "editor",
    [string]$Arch = "x86_64",
    [int]$Jobs = 0,
    [string[]]$SconsArgs = @()
)

$ErrorActionPreference = "Stop"

function Write-CompileBar {
    param(
        [int]$Percent,
        [int]$Width = 40,
        [string]$Status = "Compiling"
    )

    $clamped = [Math]::Max(0, [Math]::Min(100, $Percent))
    $filled = [Math]::Floor(($clamped / 100.0) * $Width)
    $empty = $Width - $filled
    $bar = ("#" * $filled) + ("-" * $empty)
    Write-Host -NoNewline ("`r[{0}] {1,3}% {2}" -f $bar, $clamped, $Status)
}

if ($Jobs -le 0) {
    try {
        $Jobs = [Math]::Max(1, (Get-CimInstance Win32_Processor | Measure-Object -Property NumberOfLogicalProcessors -Sum).Sum)
    }
    catch {
        $Jobs = 4
    }
}

$nodeCountFile = Join-Path $PSScriptRoot ".scons_node_count"
$expectedSteps = 0
if (Test-Path $nodeCountFile) {
    try {
        $expectedSteps = [int](Get-Content $nodeCountFile -TotalCount 1)
    }
    catch {
        $expectedSteps = 0
    }
}

$script:sconsLines = 0
$script:lastPercent = 0

Write-CompileBar -Percent 0 -Status "Starting"

$baseArgs = @(
    "platform=$Platform",
    "target=$Target",
    "arch=$Arch",
    "progress=yes",
    "-j", "$Jobs"
)

if ($SconsArgs.Count -gt 0) {
    $baseArgs += $SconsArgs
}

$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = "scons"
$psi.Arguments = ($baseArgs -join " ")
$psi.WorkingDirectory = $PSScriptRoot
$psi.UseShellExecute = $false
$psi.RedirectStandardOutput = $true
$psi.RedirectStandardError = $true
$psi.CreateNoWindow = $true

$process = New-Object System.Diagnostics.Process
$process.StartInfo = $psi

$lineHandler = {
    param($customSender, $customEvent)
    $line = $event.Data
    if ([string]::IsNullOrWhiteSpace($line)) { return }

    if ($line -match "\[(\s*\d+)%\]") {
        $p = [int]$matches[1]
        if ($p -gt $script:lastPercent) { $script:lastPercent = $p }
        Write-CompileBar -Percent $script:lastPercent -Status "Compiling"
        return
    }

    $script:sconsLines++

    if ($expectedSteps -gt 0) {
        $estimated = [int][Math]::Min(99, [Math]::Floor(($script:sconsLines * 100.0) / $expectedSteps))
    }
    else {
        # First build fallback: smooth progress to 99 until completion.
        $estimated = [int][Math]::Min(99, [Math]::Floor(100 * (1 - [Math]::Exp(-$script:sconsLines / 180.0))))
    }

    if ($estimated -gt $script:lastPercent) {
        $script:lastPercent = $estimated
        Write-CompileBar -Percent $script:lastPercent -Status "Compiling"
    }
}

$errHandler = {
    param($customSender, $customEvent)
    $line = $event.Data
    if (-not [string]::IsNullOrWhiteSpace($line)) {
        Write-Host "`n$line"
    }
}

$process.add_OutputDataReceived($lineHandler)
$process.add_ErrorDataReceived($errHandler)

$null = $process.Start()
$process.BeginOutputReadLine()
$process.BeginErrorReadLine()
$process.WaitForExit()

if ($process.ExitCode -eq 0) {
    Write-CompileBar -Percent 100 -Status "Done"
    Write-Host ""
    Write-Host "Compile completed successfully."
    exit 0
}

Write-Host ""
Write-Host "Compile failed with exit code $($process.ExitCode)."
exit $process.ExitCode
