function [cx, cy, w, h, orient, count] = getObjectRegion(keypt1, keypt2, matches, objbox, thresh)
% Get the center x-y (cx,cy), width and height (w,h), and orientation
% (orient) for each predicted object bounding box in the image.

% YOUR CODE HERE
% Find parameters for object bounding box
objx = 0; % x-center
objy = 0; % y-center
objw = 0;
objh = 0;

% Find parameters for keypoints in image 1
s1 = 0;
o1 = 0;
x1 = 0;
y1 = 0;

% Find parameters for keypoints in image 2
s2 = 0;
o2 = 0;
x2 = 0;
y2 = 0;

% Use four uniform bins for each dimension, vote from each keypoint and
% store all the bounding boxes whose votes is larger than thresh.

cx = []; cy = []; w = []; h = []; orient = []; count = [];







% Potentially useful function:
% creates nb uniform bins within range of x and assigns each x to a bin
% example usage:
% myhistogram = assign2bins(data_vector, number_of_bins)
% myhistogram is now an array of the same length as data_vector, in which
% all entries now correspond to their bin index.
function b = assign2bins(x, nb)
b = min(max(ceil((x-min(x))/(max(x)-min(x))*nb), 1), nb);

