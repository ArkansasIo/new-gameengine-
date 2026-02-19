import os
import argparse
import yaml
import json

def load_menu(config_path):
    if config_path.endswith('.yaml') or config_path.endswith('.yml'):
        with open(config_path, 'r') as f:
            return yaml.safe_load(f)
    elif config_path.endswith('.json'):
        with open(config_path, 'r') as f:
            return json.load(f)
    else:
        raise ValueError("Config file must be .yaml, .yml, or .json")

def write_python_stub(path, classname):
    with open(path, 'w') as f:
        f.write(f'"""Auto-generated {classname} module."""\n\n')
        f.write(f"class {classname}:\n")
        f.write(f"    def __init__(self):\n")
        f.write(f"        pass  # TODO: Initialize {classname}\n\n")
        f.write(f"    def run(self):\n")
        f.write(f"        pass  # TODO: Implement {classname} logic\n")

def write_cpp_stub(header_path, source_path, classname):
    guard = f"{classname.upper()}_H"
    with open(header_path, 'w') as h:
        h.write(f"// Auto-generated {classname} header\n")
        h.write(f"#ifndef {guard}\n#define {guard}\n\n")
        h.write(f"class {classname} {{\npublic:\n    {classname}();\n    void run();\n}};\n\n#endif // {guard}\n")
    with open(source_path, 'w') as cpp:
        cpp.write(f"// Auto-generated {classname} source\n")
        cpp.write(f'#include "{os.path.basename(header_path)}"\n\n')
        cpp.write(f"{classname}::{classname}() {{\n    // TODO: Initialize {classname}\n}}\n\n")
        cpp.write(f"void {classname}::run() {{\n    // TODO: Implement {classname} logic\n}}\n")

def generate_files(menu, base_dir, language):
    os.makedirs(base_dir, exist_ok=True)
    for category, tools in menu.items():
        cat_dir = os.path.join(base_dir, category)
        os.makedirs(cat_dir, exist_ok=True)
        for tool in tools:
            classname = tool
            if language == "py":
                file_path = os.path.join(cat_dir, f"{tool}.py")
                write_python_stub(file_path, classname)
            elif language == "cpp":
                header_path = os.path.join(cat_dir, f"{tool}.h")
                source_path = os.path.join(cat_dir, f"{tool}.cpp")
                write_cpp_stub(header_path, source_path, classname)
            else:
                print(f"Unsupported language: {language}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Bulk Source Code File Generator")
    parser.add_argument("--config", required=True, help="Path to menu config (YAML/JSON)")
    parser.add_argument("--out", required=True, help="Output directory")
    parser.add_argument("--lang", choices=["py", "cpp"], default="py", help="Language: py or cpp")
    args = parser.parse_args()

    menu = load_menu(args.config)
    generate_files(menu, args.out, args.lang)
    print(f"Files generated in {args.out} for language {args.lang}")
