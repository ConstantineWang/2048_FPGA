from PIL import Image

# open folder, load all images, for each image, output to image_name_r.mem, image_name_g.mem, image_name_b.mem

# open folder
import os
path = os.getcwd()
print(path)

TARGET_DIR = path + '/youdied_asset/'
OUTPUT_DIR = path + '/youdied_bin/'

MASTER_FILE = OUTPUT_DIR + 'youdied'

# load all images
from os import listdir
from os.path import isfile, join

onlyfiles = [f for f in listdir(TARGET_DIR) if isfile(join(TARGET_DIR, f))]
# onlyfiles.sort(key=lambda f: int(''.join(filter(str.isdigit, f))))
print(onlyfiles)

# open master file
m_red = open(MASTER_FILE + "_r.mem", 'w')
m_green = open(MASTER_FILE + "_g.mem", 'w')
m_blue = open(MASTER_FILE + "_b.mem", 'w')

# for each image, output to image_name_r.mem, image_name_g.mem, image_name_b.mem
for f in onlyfiles:
    img = Image.open(TARGET_DIR + f)

    # change image to RGB
    img = img.convert('RGB')

    pixels = img.load() 
    width, height = img.size

    red = open(OUTPUT_DIR + f[:-4] + '_r.mem', 'w')
    green = open(OUTPUT_DIR + f[:-4] + '_g.mem', 'w')
    blue = open(OUTPUT_DIR + f[:-4] + '_b.mem', 'w')

    print("width: %d, height: %d" % (width, height))

    for y in range(height):      # this row
        for x in range(width):   # and this row was exchanged
            r, g, b = pixels[x, y]
            
            # in case your image has an alpha channel
            # r, g, b, a = pixels[x, y]

            # write hex to file
            # file.write("%02x %02x %02x " % (r//32, g//32, b//32))
            red.write("%02x " % (r//16))
            green.write("%02x " % (g//16))
            blue.write("%02x " % (b//16))

            m_red.write("%02x " % (r//16))
            m_green.write("%02x " % (g//16))
            m_blue.write("%02x " % (b//16))

    # red.write('\n')
    # green.write('\n')
    # blue.write('\n')

