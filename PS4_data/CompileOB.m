function [OBFeatures] = CompileOB(files, models, pyramidLevels)

%% NOTE: You should not need to modify this file
% As a hint, the features returned by MaxGetSpatialPyramid.m should contain 'num_features_per_map' features
% This file takes care of the book keeping issues involved with concatenating the features. Basically, it
% loops over all the required variables such as number of models, number of files in the given set corresponding
% to each model, and the number of scales given a model and image.

%% Fix required parameters
num_models = length(models);
num_features_per_map = sum(4.^(0:pyramidLevels-1));
num_scales_per_model = 8;
OBFeatures = zeros(length(files), num_models*num_scales_per_model*num_features_per_map);

for i=1:num_models
    if(mod(i, 10)==0)
	    disp([num2str(i) ' of ' num2str(num_models)]);
    end
    currentIdx = (i-1)*num_scales_per_model*num_features_per_map + 1;
    model_name = num2str(models{i});
    for j=1:length(files)
        input_file = [files{j} '_' model_name '.mat'];
        curr = load(input_file);
        for k=1:length(curr.response_maps)
        
            % NOTE: THE FUNCTION THAT YOU NEED TO UPDATE (MaxGetSpatialPyramid.m) IS GIVEN
            % ONE RESPONSE MAP AT A TIME - YOU JUST NEED TO FIND THE OUTPUT FOR THAT    
        
            features = MaxGetSpatialPyramid(curr.response_maps{k}, pyramidLevels);
            OBFeatures(j, currentIdx+(k-1)*num_features_per_map:currentIdx+k*num_features_per_map-1) = features;
        end
    end
end