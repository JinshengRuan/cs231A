%% PS4: Problem 2(c)
% As in the previous part, a lot of skeleton code for book keeping has been provided for you.
% The variables share similar names as in Problem2a.m, and have not been described again.
% NOTE: PLEASE FEEL FREE TO MODIFY ANY PART OF THIS CODE AS LONG AS YOU ARE
% USING OB FEATURES. THE CURRENT CODE IS DESIGNED TO LOAD THE SINGLE TEST
% IMAGE AND A SUBSET OF THE TRAINING IMAGES AND CONSTRUCT THEIR OB
% FEATURES.

%% Get filenames of response map files (train_files/test_files)
% Get corresponding labels of files (train_labels/test_labels)
% Get the model names (models) for the 50 different models used
%
% NOTE: You should not need to update anything in this part of the file.

res = PrunedImgNetDetectorSet;
classes = {'badminton', 'rowing', 'sailing', 'snowboarding'};

num_models = 50;
models = res(1:num_models);

input_folder = 'images/';
response_maps_folder = 'response_maps/';

%% Loads train_files and test_files specific to this part (DO NOT CHANGE)
% Note: train_files and test_files has been defined a little differently
% for this part as we also require the images together with the response
% maps. The appropriate function to obtain the OB features using the
% updated train_files and test_files is provided below (In the code below,
% CompileOB should not require any modification).
loadImageRetrievalData;

%% NOTE: Set the number of pyramid levels (0 level SPM has 1 level, and similarly 2 level SPM has 3 levels)
pyramidLevels = 3;

%% Compile the OB features in CompileOB.m
% YOU NEED TO UPDATE THE CODE IN MaxGetSpatialPyramid.m FOR THIS TO WORK (IN PART (b))

%Train_OBFeatures = CompileOB(cellfun(@(x) [response_maps_folder x ], train_files, 'UniformOutput', false), models, pyramidLevels);
%Test_OBFeatures = CompileOB(cellfun(@(x) [response_maps_folder x ], test_files, 'UniformOutput', false), models, pyramidLevels);


%% ADD YOUR CODE HERE.
% In order to display the results, our code assumes that there is a vector
% called 'closeness_measure' that is of size (length(train_files), 1). The
% smaller the value corresponding to index i of this array, the better the
% match with the test image. Our code displays the top 8 matches with the
% given test image. You need to submit the resulting output of that
% function with your problem set (other info in set). In case the
% closeness_measure is all zeros, the output will be a random subset of
% images (may change for each run of the function).
%
% NOTE: In case your metric is defined such that a larger value implies the
% image is a better match to the test image, you can use:
% closeness_measure = -closeness_measure;

closeness_measure = zeros(length(train_files), 1);

%% DO NOT MODIFY CODE BELOW THIS LINE
displayMatches(train_files, test_files, input_folder, closeness_measure);