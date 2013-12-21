%Problem 5: Image Stitching
%This code is a skeleton for you to implement yor own image stitching
%algorithm. This is not a formal structure, but should give you everything
%you need to build your own stitching algorithm. 
%Running this code with the current settings will simply overlay the two
%images on top of each other

%Pick your test images. 
img1_name = 'uttower2.JPG';
img2_name = 'uttower1.JPG';

img1 = imread(img1_name);
img2 = imread(img2_name);

%CPSelect will open MATLAB's Control Point Selection UI
%This will output two arrays; base_points and input_points
%You do not have to call this cpselect every time, providing you save 
%the vectors input_points and base_points.
cpselect(img1_name, img2_name); pause;

%Here you calculate the transformation matrix with your code

%YOUR CODE HERE

% H = findHAMatrix(input_points, base_points);  % for part (b)
% H = findHMatrix(input_points, base_points);  % for part (c)
H = [1 0 0; 0 1 0; 0 0 1];
TFORM = maketform('projective',H);

%END CODE

%The remainder of this code is just plotting your result
[trans xdata ydata] = imtransform(img1, TFORM);
[n o b] = size(trans);
[l m z] = size(img2);

%Now combine the two images into a final output
combine_images(xdata,ydata, trans, img2)
