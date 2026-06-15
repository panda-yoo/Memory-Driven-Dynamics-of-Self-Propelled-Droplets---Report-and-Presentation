import os
import re

def extract_images(base_dir):
    images = set()
    for root, dirs, files in os.walk(base_dir):
        for file in files:
            if file.endswith('.tex'):
                with open(os.path.join(root, file), 'r', encoding='utf-8') as f:
                    content = f.read()
                    # Match includegraphics handling newlines
                    matches = re.findall(r'\\includegraphics(?:\[.*?\])?\s*\{([^}]+)\}', content, flags=re.DOTALL)
                    for match in matches:
                        images.add(match.strip())
    return images

report_imgs = extract_images('report')
pres_imgs = extract_images('presentation')

print("Report used images:")
for img in sorted(report_imgs):
    print(img)

print("\nPresentation used images:")
for img in sorted(pres_imgs):
    print(img)
