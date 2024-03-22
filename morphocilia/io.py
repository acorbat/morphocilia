from aicsimageio import AICSImage
from pathlib import Path
from skimage.exposure import rescale_intensity


def load_rescaled_channel(filepath: Path, scene: str, channel: int):
    """Loads a specific channel from a scene in a lif file and rescales it
    according to its own bit depth."""
    file = AICSImage(filepath)
    file.set_scene(scene)
    return rescale_intensity(file.dask_data[0][channel])
