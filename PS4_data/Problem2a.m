%% PS4: Problem 2(a)
% NOTE: You only need to edit the sections that have been marked in the
% following files:
%  this file (liblinear training + testing)
%  CompileBoW.m

%% Get filenames of descriptor files - this part is just book keeping and has been provided for you. The outcome includes:
%   train_files (cell array) - contains the name of all the input mat files that contain the SIFT descriptors corresponding
%     to each of the images in the training set
%   test_files (cell array) - same as train_files, except for the test set
%   train_labels/test_labels (1D arrays) - contain the labels for each of the descriptor files
%
%  NOTE: You do not need to change this part if you keep the same directory structure as in the zip file

input_folder = 'descriptors/';

classes = {'badminton', 'rowing', 'sailing', 'snowboarding'};
train_files = cell(0, 1);
train_labels = [];

test_files = cell(0, 1);
test_labels = [];

for i=1:length(classes)
    files = arrayfun(@(x) x.name, dir([input_folder classes{i} '/train/*.mat']), 'UniformOutput', false);
    train_files(end+1:end+length(files), 1) = cellfun(@(x) [input_folder classes{i} '/train/' x], files, 'UniformOutput', false);
    train_labels(end+1:end+length(files), 1) = i;
    
    files = arrayfun(@(x) x.name, dir([input_folder classes{i} '/test/*.mat']), 'UniformOutput', false);
    test_files(end+1:end+length(files), 1) = cellfun(@(x) [input_folder classes{i} '/test/' x], files, 'UniformOutput', false);
    test_labels(end+1:end+length(files), 1) = i;
end

%% Load the saved dictionary
%   dictionary (matrix) - contains the codebook to use for BoW assignment
load('dictionary_256.mat');

%% Compile BoW Features
%  YOU NEED TO UPDATE THE CODE IN CompileBoW.m

Train_BoW_Features = CompileBoW(train_files, dictionary);
Test_BoW_Features = CompileBoW(test_files, dictionary);


%% Train a linear SVM using liblinear
%   NOTE: The liblinear library provided was compiled on the clusters, and has been tested to work there. If you are
%    using it locally, consider using the version from PS0.

addpath('liblinear-1.7/matlab/');

%% YOU NEED TO UPDATE THE CODE BELOW THIS LINE. SKELETON CODE HAS BEEN PROVIDED.
% Liblinear options to use:
% -s 2
% Set bias to 1
% Set C value to 10
svm_options = ''; %
model = train();
[predicted_labels, accuracy] = predict();

%% DO NOT UPDATE CODE BELOW THIS LINE
expected_accuracy = 77.5;
disp(['Expected Accuracy: ' num2str(expected_accuracy) '%']);

if(abs(accuracy-expected_accuracy)>0.1)
    disp('Try again! Did you normalize each histogram to sum to 1? Did you use the correct SVM parameters?');
else
    disp('Good job! Move on to the next part!')
end