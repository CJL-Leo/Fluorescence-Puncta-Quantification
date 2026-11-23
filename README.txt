fluorescent puncta counting — analysis record
==================================================

Purpose
-------
Counts connected foreground objects in TIFF images using MATLAB standard
image-processing functions. 
This is an analysis script, not a newly developed segmentation algorithm.

Contents
--------
puncta_counting_batch.m 

Workflow and fixed parameters
-----------------------------
1. List all *.tiff images in imageDir.
2. Read each image and convert RGB to grayscale (rgb2gray).
3. Apply a fixed grayscale threshold of 130: gray_img > 130.
4. Fill holes (imfill with "holes").
5. Morphological dilation (imdilate) with a disk-shaped structuring element
   of radius 1 pixel (strel('disk', 1)).
6. Count connected foreground components using bwlabel.
7. Display each image filename and its count in the MATLAB Command Window.

How to run
----------
1. Open the .m file in MATLAB.
2. Change imageDir to the folder containing the TIFF images you want to count.
   CAUTION: The provided original script contains a historical Mac local path.
   Replace this local path before executing or sharing publicly if desired.
3. Ensure the images are RGB images readable by rgb2gray and stored as .tiff.
4. Run the script. The Command Window displays the filename, followed by
   a number identifying the detected connected components.

Software
--------
MATLAB with Image Processing Toolbox is required.

The script uses standard MATLAB image-processing functions and is not designed for a specific MATLAB release or operating system. 

The image-processing workflow was validated using MATLAB Online R2026b Update 2. No specialized hardware is required.



