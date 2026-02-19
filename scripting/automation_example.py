"""
Example Python automation script for editor batch operations.
"""
import os

def batch_rename_assets(asset_dir, prefix):
    for filename in os.listdir(asset_dir):
        if filename.endswith('.gd'):
            new_name = prefix + filename
            os.rename(os.path.join(asset_dir, filename), os.path.join(asset_dir, new_name))
            print(f"Renamed {filename} to {new_name}")

if __name__ == "__main__":
    # Example usage
    batch_rename_assets("../editor", "BP_")
