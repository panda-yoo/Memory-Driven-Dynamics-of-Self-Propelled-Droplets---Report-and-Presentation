import os
import re
import shutil

def flatten_project(project_dir, source_img_dir, target_img_dir):
    if not os.path.exists(target_img_dir):
        os.makedirs(target_img_dir)
        
    for root, dirs, files in os.walk(project_dir):
        for file in files:
            if file.endswith('.tex'):
                file_path = os.path.join(root, file)
                with open(file_path, 'r', encoding='utf-8') as f:
                    content = f.read()
                
                # Find all includegraphics paths
                def replacer(match):
                    full_match = match.group(0)
                    options = match.group(1) if match.group(1) is not None else ""
                    path = match.group(2).strip()
                    
                    # Clean up path
                    clean_path = path.lstrip('/')
                    # Remove 'images/' or 'figures/' prefix if present
                    if clean_path.startswith('images/'):
                        clean_path = clean_path[len('images/'):]
                    elif clean_path.startswith('figures/'):
                        clean_path = clean_path[len('figures/'):]
                    
                    # Generate flat name
                    flat_name = clean_path.replace('/', '_').replace('\\', '_')
                    
                    # Look for the source file
                    src_file = os.path.join(source_img_dir, clean_path)
                    if not os.path.exists(src_file):
                        # Try without path prefix if it didn't have one
                        src_file = os.path.join(source_img_dir, path)
                    
                    if os.path.exists(src_file):
                        # Copy to flat name
                        dst_file = os.path.join(target_img_dir, flat_name)
                        shutil.copy2(src_file, dst_file)
                    
                    return f"\\includegraphics{options}{{{flat_name}}}"
                
                new_content = re.sub(r'\\includegraphics(\[.*?\])?\s*\{([^}]+)\}', replacer, content, flags=re.DOTALL)
                
                if new_content != content:
                    with open(file_path, 'w', encoding='utf-8') as f:
                        f.write(new_content)
                    print(f"Updated {file_path}")

flatten_project('report', 'report/images', 'report/assets/images')
flatten_project('presentation', 'report-ppt/figures', 'presentation/assets/images')

# For the logo, it's explicitly \includegraphics{logo.png} in frontmatter/titlepage.tex
# but the script already handles flat names. 
# We just need to make sure logo.png is moved to report/assets/logos/logo.png.
if os.path.exists('report/images/logo.png'):
    os.makedirs('report/assets/logos', exist_ok=True)
    shutil.copy2('report/images/logo.png', 'report/assets/logos/logo.png')

print("Flattening complete.")
