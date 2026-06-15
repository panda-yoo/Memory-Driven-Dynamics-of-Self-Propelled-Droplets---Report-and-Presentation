import os
import re

def find_tex_files(start_dir):
    tex_files = []
    for root, dirs, files in os.walk(start_dir):
        for file in files:
            if file.endswith('.tex'):
                tex_files.append(os.path.join(root, file))
    return tex_files

def extract_dependencies(tex_files):
    dependencies = {
        'images': set(),
        'inputs': set(),
        'bibs': set()
    }
    
    img_pattern = re.compile(r'\\includegraphics(?:\[.*?\])?\{(.*?)\}')
    input_pattern = re.compile(r'\\(?:input|include)\{(.*?)\}')
    bib_pattern = re.compile(r'\\(?:bibliography|addbibresource)\{(.*?)\}')
    
    for file in tex_files:
        with open(file, 'r', encoding='utf-8', errors='ignore') as f:
            for line in f:
                # remove comments
                line = line.split('%')[0]
                
                for img in img_pattern.findall(line):
                    dependencies['images'].add(img)
                for inp in input_pattern.findall(line):
                    dependencies['inputs'].add(inp)
                for bib in bib_pattern.findall(line):
                    dependencies['bibs'].add(bib)
                    
    return dependencies

all_tex = find_tex_files('.')
deps = extract_dependencies(all_tex)

print("Images:")
for img in sorted(list(deps['images'])):
    print(f"  {img}")
print("Inputs:")
for inp in sorted(list(deps['inputs'])):
    print(f"  {inp}")
print("Bibs:")
for bib in sorted(list(deps['bibs'])):
    print(f"  {bib}")
