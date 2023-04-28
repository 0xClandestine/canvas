from PIL import Image

def unique_colors_index_for_pixel(rgb, unique_colors):
    color_hex = "%02x%02x%02x" % tuple(rgb)
    return unique_colors.index(color_hex)

def codegen(image_path):
    image = Image.open(image_path, "r").resize((10, 10)).convert("RGB")

    if image.mode != "RGB":
        print("Unknown mode: %s" % image.mode)
        return None

    rgb = list(image.getdata())

    colors = ["%02x%02x%02x" % tuple(rgb[i]) for i in range(len(rgb))]

    unique_colors = list(set(colors))

    if len(unique_colors) < 10:
        output = format(len(unique_colors), "02x")
    else:
        output = format(len(unique_colors), "x")

    for i in range(len(unique_colors)):
        output += unique_colors[i]

    index_list = []
    x_cord_list = []
    y_cord_list = []

    for j in range(100):

        x_cord = j % 10  # Sample x coordinate calculation
        y_cord = j // 10  # Sample y coordinate calculation
        index = unique_colors_index_for_pixel(rgb[j], unique_colors)

        index_list.append(index)
        x_cord_list.append(x_cord)
        y_cord_list.append(y_cord)

    for i in range(len(index_list)):
        x_cord = format(x_cord_list[i], "02x")
        y_cord = format(y_cord_list[i], "02x")
        index = format(index_list[i], "02x")

        output += index + x_cord + y_cord

    return output

print("0x" + codegen("test.png"))