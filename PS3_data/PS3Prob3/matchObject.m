function matchObject(im1, desc1, keypt1, objbox, im2, desc2, keypt2)

% objbox is the bounding box in image 1 in the form of [x_min y_min x_max y_max]
% Remove points outside of the object bounds
if ~isempty(objbox)
    [desc1, keypt1] = selectKeypointsInBbox(desc1, keypt1, objbox(1), objbox(2), objbox(3), objbox(4));
end

thresh = 0.7;

% PART A:
% IMPLEMENT matchKeypoints
% Each column of desc1 or desc2 is a 128-d descriptor vector of a keypoint.
% matches is a 2 x N array of indices that indicates which keypoints in
% desc1 match which keypoints in desc2.
matches = matchKeypoints(desc1, desc2, thresh);
if size(matches, 2) == 2 % matches should be 2 x npts
    matches = matches';
end

% Display the matched keypoints
figure(1), hold off, clf
plotmatches(im2double(im1),im2double(im2),keypt1,keypt2,matches);

% PART C: 
% IMPLEMENT getObjectRegion
% Get the center x-y (cx,cy), width and height (w,h), and orientation
% (orient) for each predicted object bounding box in the image.
minpts = 5;
[cx, cy, w, h, orient, count] = getObjectRegion(keypt1, keypt2, matches, objbox, minpts);

% Display the detected objects
% "orient" here is counter-clockwise, with right/east=0 radians
figure(2), hold off, imagesc(im2), axis image; axis off
[mv, mi] = max(count);
for k = 1:numel(count)
    x = cx(k) + [-w(k)/2*cos(orient(k))-h(k)/2*sin(orient(k))
        -w(k)/2*cos(orient(k))+h(k)/2*sin(orient(k))
        w(k)/2*cos(orient(k))+h(k)/2*sin(orient(k))
        w(k)/2*cos(orient(k))-h(k)/2*sin(orient(k))];
    x(end+1) = x(1);
    y = cy(k) + [w(k)/2*sin(orient(k))-h(k)/2*cos(orient(k))
        w(k)/2*sin(orient(k))+h(k)/2*cos(orient(k))
        -w(k)/2*sin(orient(k))+h(k)/2*cos(orient(k))
        -w(k)/2*sin(orient(k))-h(k)/2*cos(orient(k))];
    y(end+1) = y(1);
    hold on, plot(x, y, 'g', 'linewidth', 5);
    hold on, plot(x, y, 'k', 'linewidth', 1);         
end

%If you would like to save your results to an image file, 
%uncomment the following two lines:
%print -f1 -depsc ./example_match_fig4.eps
%print -f2 -depsc ./example_detect_fig4.eps
