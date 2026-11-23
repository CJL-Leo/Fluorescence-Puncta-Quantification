% MATLAB-based fluorescence puncta quantification
% Batch processing of individual-cell RGB TIFF images.
% Requires the Image Processing Toolbox.
%
% Place the TIFF images in the current MATLAB folder, or replace pwd
% with the path to the folder containing the images.

% Specify the image directory.
imageDir = pwd;

% Find all TIFF images in this directory.
imageFiles = dir(fullfile(imageDir, '*.tiff'));

% Process each image separately.
for i = 1:length(imageFiles)

    % Read the image.
    imagePath = fullfile(imageDir, imageFiles(i).name);
    image = imread(imagePath);

    % Convert the RGB image to grayscale.
    gray_img = rgb2gray(image);

    % Apply the original fixed grayscale threshold.
    bw_img = gray_img > 130;

    % Fill holes within binary objects.
    bw_img2 = imfill(bw_img, 'holes');

    % Dilate with a disk-shaped structuring element (radius: 1 pixel).
    SE = strel('disk', 1);
    bw_img3 = imdilate(bw_img2, SE);

    % Label and count connected components.
    [L, num] = bwlabel(bw_img3);

    % Display the filename and number of detected objects.
    fprintf('Image: %s\n', imageFiles(i).name);
    fprintf('Detected objects: %d\n', num);

end
