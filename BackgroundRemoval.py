from tkinter.filedialog import askdirectory
from tkinter import Tk
from os import listdir
from skimage import io
from skimage import util
import numpy as np

Tk().withdraw()

dir1 = askdirectory(title='Choose source directory')
dir2 = askdirectory(title='Choose destination directory')
print(dir1)
print(dir2)


for f in listdir(dir1):
    if f.find('background') == 0 or f.find('Background') == 0:
        bgr = io.imread(dir1+'/'+f)
        bgr = util.invert(bgr)
for f in listdir(dir1):
    if f.find('background') != 0 and f.find('Background') != 0:
        img = io.imread(dir1+'/'+f)
        img = np.add(img, bgr)
        img[img<bgr] = 255
        io.imsave(dir2+'/'+f, img)

print('Done!')
