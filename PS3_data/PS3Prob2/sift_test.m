addpath('KeypointDetect');
clear;
img = imread('elmo.jpg');

figure(1);
subplot(1,2,1);
image(img);
colormap(gray(256));
title('Elmo!');
drawnow;

% Detect the SIFT features:
fprintf(1,'Computing the SIFT features for Elmo.jpg...\n')
[features,pyr,imp,keys] = detect_features(img);

% The features matrix has one keypoint per row. Each column is the
% following:
% Column 1: and 2: x and y position (sub pixel adjusted)
% Column 3: scale value (sub scale adjusted in units of pyramid level)
% Column 4: size of feature on original image        
% Column 5: edge flag
% Column 6: orientation angle
% Column 7: save curvature of response through scale space

% Although useful for plotting the keypoints, you will not be concerned with
% all seven parameters per keypoint. Namely, you just want the x,y, scale
% and theta parameters
% Note that this showfeatures script will draw a red line instead of a box
% for all points that it considers edges.
subplot(1,2,2);
showfeatures(features,img);
title('SIFT features of Elmo!');
drawnow;

% You will implement this in Part B.
% note that you can ignore the last four parameters of the keypoints as
% simply parameters for the showfeatures function.
keypoints = features(:,[1:3 6]);
descriptors = [];% = mySIFTdescriptor(img,features(:,[1:3 6]));
run('./mySIFTdescriptor.m');
%for clarity in the plotting, let's just choose the n "biggest" descriptors
%(judged by the 2-norm of the vector)
n = 10; % Number of descriptors to plot. Feel free to play with this number.
figure;
imagesc(img);
hold on;
plotsiftdescriptor(descriptors(1:n,:)', features(1:n,1:3)');
title('Overlaid descriptors');
hold off;

%%Now testing that the result matches!
load('saved_results.mat');
I_mag_error = sum((I_mag - I_mag_result).^2,2);
if (I_mag_error == 0) 
    fprintf('Passed: calculation of I_mag.\n')    
else
    fprintf('Failed: calculation of I_mag.\n') 
end
I_theta_error = sum((I_theta - I_theta_result).^2,2);
%if (I_theta_error == 0) 
if (sum(I_theta_error) < eps) 
    fprintf('Passed: calculation of I_theta.\n')    
else
    fprintf('Failed: calculation of I_theta.\n') 
end

if(exist('patch_ang','var'))
    patch_ang_error = sum((patch_ang - patch_ang_result).^2,2);
    if (patch_ang_error == 0) 
        fprintf('Passed: calculation of patch_ang.\n')    
    else
        fprintf('Failed: calculation of patch_ang.\n') 
    end
else
    fprintf('Failed: patch_ang not calculated, patch alignment problem.\n') 
end

if(exist('patch_mag','var'))
patch_mag_error = sum((patch_mag - patch_mag_result).^2,2);
    if (patch_mag_error == 0) 
        fprintf('Passed: calculation of patch_mag.\n')    
    else
        fprintf('Failed: calculation of patch_mag.\n') 
    end
else
    fprintf('Failed: patch_mag not calculated, patch alignment problem.\n') 
end

result = mean(sqrt(sum(abs(descriptors_result - descriptors).^2,2)));
fprintf('Now checking result ...');
error = abs(100*(result/.6280));
if(error < 10)
    fprintf('\nHooray! You passed with %2.0f percent error!\n',error)
else
    fprintf('\nSorry but your result of %2.0f percent error is not close enough\n',min(error, abs(100-error)));
end
