% CS 231A (Fall 2012)
% Problem Set 1
% Problem 1

% load data
readYaleFaces;

% Poblem 1.d 
% -----------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Your Code Here -- <code part A> %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Subtract mean image


% SVD (check the help for SVD options)


% remember to report first 5 singular values 



% Problem 1.e -- determine accuracy and threshold
% ------------------------------------------------

% create a variable norm_error = || y - y_{proj} ||_2 to be used to compare to
% threshold below to determine accuracy. Use 25 EigenFaces.

for i = 1:20
    clear x;
    testFileName = ['image' num2str(i)];
    x = eval(testFileName);
    x = double(reshape(x,size(x,1)*size(x,2),1));
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Your Code Here -- <code part B> %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end




% Don't change this code, you can use it to report number of correct
% classifications

%EVALUATION
%-----------
num_gnd_truth = 20;
gnd_truth = ones(num_gnd_truth,1);
gnd_truth(1) = 0;
gnd_truth(3) = 0;
gnd_truth(6) = 0;
gnd_truth(12) = 0;
gnd_truth(14) = 0;

thres = 10^8*[.009 .09 .9 9];
num_correct = 0;
for i = 1:length(thres)
    for j = 1:length(gnd_truth)
        if ( norm_error(j) < thres(i) && gnd_truth(j) == 1)
            num_correct = num_correct + 1;
        elseif (norm_error(j) > thres(i) && gnd_truth(j) == 0)
            num_correct = num_correct + 1;
        end
    end
    fprintf('The number of correct faces detected at thresh %f = %d\n', thres(i), num_correct);
    num_correct = 0;
end

% VISUALIZATION
% --------------
%Uncomment lines below to plot top 25 Eigenfaces. U is assumed to be the matrix of
%Eigenface vectors. The i^{th} column should be the i^{th} Eigen vector.

% for i = 1:25
% subplot(5,5,i);
% ui = reshape(U(:,i), [243 320]);
% imagesc(ui);colormap(gray);
% title(sprintf('Eigen:%d', i));
% end