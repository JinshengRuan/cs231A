%% NOTE: YOU NEED TO FILL IN THE CORE PARTS OF THIS FUNCTION
% Skeleton code has been provided for you to make life easier. Specifically,
% the given code loops over all the files in the given set of images and computes
% the BoW descriptor for each file and stores it in the variable BoW_Features.
% The loaded structure 'features' contains the 'data' field which holds all the SIFT
% descriptors corresponding to the given image. This is a n*128 matrix where n is 
% the number of SIFT descriptors for the given image. Your task is to assign each
% SIFT descriptor to a codebook entry using minimum euclidean distance and generate
% a BoW feature representation for each image.
% Hint: What should the bins of each histogram sum to? Why?

function [BoW_Features] = CompileBoW( imageFileList, dictionary)

fprintf('Building BoW Features...\n');

% Basic parameter: Codebook size
dictionarySize = size(dictionary, 1);

% Declare the BoW feature matrix to be of appropriate size
BoW_Features = zeros();

for f = 1:length(imageFileList)
    if(mod(f, 20)==0)
        disp([num2str(f) ' of ' num2str(length(imageFileList))]);
    end
    
    imageFName = imageFileList{f};
    features = load(imageFName);
        
    % FILL IN YOUR CODE HERE TO COMPUTE THE BoW FEATURE


    BoW_Features(f, :) = ?;

end

fprintf('Done!\n');