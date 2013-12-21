%% PS4: Problem 2(b)(i)
% NOTE: You only need to edit the sections that have been marked in the following files:
%  this file (liblinear training + testing)
%  MaxGetSpatialPyramid.m
% As in the previous part, a lot of skeleton code for book keeping has been provided for you.
% The variables share similar names as in Problem2a.m, and have not been described again.

%% Get filenames of response map files (train_files/test_files)
% Get corresponding labels of files (train_labels/test_labels)
% Get the model names (models) for the 50 different models used
%
% NOTE: YOu do not need to update anything in this part of the file.

res = PrunedImgNetDetectorSet;
classes = {'badminton', 'rowing', 'sailing', 'snowboarding'};

num_models = 50;
models = res(1:num_models);

input_folder = 'images/';
response_maps_folder = 'response_maps/';

train_files = cell(0, 0);
train_labels = [];

test_files = cell(0, 0);
test_labels = [];

for i=1:length(classes)
    files = arrayfun(@(x) x.name, dir([input_folder classes{i} '/train/*.jpg']), 'UniformOutput', false);
    train_files(end+1:end+length(files), 1) = cellfun(@(x) [response_maps_folder classes{i} '/train/' x(1:end-4)], files, 'UniformOutput', false);
    train_labels(end+1:end+length(files), 1) = i;
    
    files = arrayfun(@(x) x.name, dir([input_folder classes{i} '/test/*.jpg']), 'UniformOutput', false);
    test_files(end+1:end+length(files), 1) = cellfun(@(x) [response_maps_folder classes{i} '/test/' x(1:end-4)], files, 'UniformOutput', false);
    test_labels(end+1:end+length(files), 1) = i;
end

%% For this part, the number of pyramidLevels is 1 (0 level SPM has 1 level, and similarly 2 level SPM has 3 levels)
pyramidLevels = 1;

%% Compile the OB features in CompileOB.m
% YOU NEED TO UPDATE THE CODE IN MaxGetSpatialPyramid.m
% It may be instructional to look through the comments in CompileOB.m, but you should not need to modify it.

Train_OBFeatures = CompileOB(train_files, models, pyramidLevels);
Test_OBFeatures = CompileOB(test_files, models, pyramidLevels);

%% Train a linear SVM using liblinear
%   NOTE: The liblinear library provided was compiled on the clusters, and has been tested to work there. If you are
%    using it locally, consider using the version from PS0.

addpath('liblinear-1.7/matlab/');

%% YOU NEED TO UPDATE THE CODE BELOW THIS LINE. SKELETON CODE HAS BEEN PROVIDED.
% Liblinear options to use:
% -s 2
% Set bias to 1
% Set C value to 0.1
svm_options = '';
model = train();
[predicted_labels, accuracy] = predict();

%% DO NOT UPDATE CODE BELOW THIS LINE
expected_accuracy = 86;
disp(['Expected Accuracy: ' num2str(expected_accuracy) '%']);

if(accuracy<expected_accuracy)
    disp('Try again! Did you use the correct SVM parameters? Are you getting the max value correctly?');
else
    disp('Good job! Move on to the next part!')
end