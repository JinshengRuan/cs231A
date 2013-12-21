%CS223B Problem Set 2, Homework 4
% Linear Fit for Perspective Camera Model Calibration

% Load in images
img1 = imread('front.png');

figure, imagesc(img1); colormap(gray);
title('Click a point on this image'); axis image;
%Take in corner input

for i = 1:12
[x y] = ginput(1);
%your points are now stored as [x,y]
fprintf(['You clicked at: ' num2str(x) ', ' num2str(y) '\n']);
img1(round(y),round(x)) = 255;
imagesc(img1); colormap(gray);
title('Click a point on this image'); axis image;
end


