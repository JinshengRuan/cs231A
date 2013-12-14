%%
%Load the data for the problem eigen faces into the memory. 
clc; clear all;
extensions = {'centerlight', 'glasses', 'happy', 'leftlight', 'noglasses', 'normal', 'rightlight', 'sad', 'sleepy', 'surprised', 'wink' };

num_extensions=length(extensions); % total 11 extensions

num_subjects=15; %the number of distinct people

m=243; % the height of each image
n=320; % the width of each image
A = [];  % zeros(m*n,num_extensions*num_subjects-15); % A is a matrix of size 243*320 by 165, thus each column of A corresponds to a distinct image.

for i=1:num_subjects    
    basename = 'yalefaces/subject';
    if( i < 10 )
        basename = [basename, '0', num2str(i)];
    else
        basename = [basename, num2str(i)];
    end;
    
    for j = 1:num_extensions,
        fullname = [basename, '.', extensions{j}];
        try
            temp = double(imread(fullname));
            a=1;
        catch
            %disp( 'does not exist')
            a = 0;
        end
        if(a)        
            A = [A reshape(temp,m*n,1)];
        end
    end
end
disp('The matrix A is loaded in memory. Its size is:')
disp(size(A));


for i = 1:20
    testFileName = ['image' num2str(i)];
    load(testFileName);
end
