function [] = displayMatches(train_files, test_files, input_folder, closeness_measure)

train_files = cellfun(@(x) [input_folder x '.jpg'], train_files, 'UniformOutput', false);
test_files = cellfun(@(x) [input_folder x '.jpg'], test_files, 'UniformOutput', false);

if(length(train_files)~=length(closeness_measure))
    error('Length of train_files and closeness_measure does not match! Check your code!');
end

figure;
subplot(3, 3, 1);
I = imread(test_files{1});
imshow(I);
title('Original Image');

new_idx = randperm(length(closeness_measure));
closeness_measure = closeness_measure(new_idx);
[distance, sort_idx] = sort(closeness_measure);

for i=1:8
    subplot(3, 3, i+1);
    I = imread(train_files{new_idx(sort_idx(i))});
    imshow(I);
    title(['(' num2str(i) ') Closeness measure: ' num2str(distance(i))]);
end