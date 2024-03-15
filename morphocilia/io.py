import matplotlib.pyplot as plt
import numpy as np
from readlif.reader import LifFile
from skimage.exposure import rescale_intensity


def lifloader(path, index):
    """
    This function loads the .lif file experiment by indicating the path where the file is found and the image index (position in the folder).
    TTiffFileunction reconstructs the image by using its channels and z stack. It returns an ndarray.
    Parameters:
    path: path
        Path where the .lif file is found.
    index: integer
        Indicates the image to be later opened from the experiment file (starting from 0).
    """
    file = LifFile(path)
    img = file.get_image(index)

    # The Z-stack images are piled up in their corresponding channels and the image is converted to an array.
    all_img = []
    for c in range(img.channels):
        this_z_stack = []
        for z in range(img.nz):
            this_z_stack.append(np.array(img.get_frame(z, 0, c, 0)))
        this_z_stack = rescale_intensity(np.asarray(this_z_stack))
        all_img.append(this_z_stack)
    all_img_array = np.array(all_img)

    # The image format is reshaped by changing the order of variables. This is done so Napari is able to read the image correctly.
    all_img_reshaped = np.reshape(
        all_img_array, (img.nz, img.channels, img.dims[0], img.dims[1])
    )
    all_img_reshaped2 = all_img_reshaped.transpose(1, 0, 2, 3)
    plt.imshow(all_img_reshaped2[0, 30, :, :])

    return all_img_reshaped2
