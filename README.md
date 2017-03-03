# Background removal script

ImageJ script for removing background from images

This script is removing background from microscopy images. It works by subtracting background image from all images in a folder. The background image should have `background` in its name, and be in the same folder as the rest of the images.
The background image should be taken using the same settings as the rest of the images but without any object. It contain only information about any peripheral darkening (vignetting), spots on the objective and background that are going to be present on all the images.
The script will save the cleaned images in destination folder as `png` files with the same name and extension ` _result`.
