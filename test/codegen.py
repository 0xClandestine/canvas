import numpy
from PIL import Image

def get_image():
    """Get a numpy array of an image so that one can access values[x][y]."""
    image = Image.open("test.png", "r").resize((10, 10)).convert('RGB')
    width, height = image.size
    pixel_values = list(image.getdata())
    if image.mode == "RGB":
        channels = 3
    else:
        print("Unknown mode: %s" % image.mode)
        return None
    hex_values = ['#%02x%02x%02x' % tuple(pixel_values[i]) for i in range(len(pixel_values))]
    pixel_values = numpy.array(hex_values).reshape((width, height))

    code = "string[] memory pixels = new string[](100);\n"

    for i in range(100):
        code = code + f"pixels[{i}] = '{pixel_values[i // 10][i % 10]}';\n"

    print(code)

get_image()