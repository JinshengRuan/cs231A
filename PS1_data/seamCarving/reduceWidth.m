function img =ReduceWidth(img_name,k)
%REDUCEWIDTH - Seam Carving in PS1-Prob 4
%INPUTS:
%   img_name: string path to the desired test image
%   k: number of vertical seams to find and remove
%OUTPUTS:
%   img: The resized image in RGB form
%Load in the image
img=imread(img_name);
orig_img = img;

%Create the figure
figure(1);
axis off;

for seam_num=1:k
    %imagesc(img);
    %PART A: Calculate the energy of the input image
    G = ComputeEnergy(img); %Create this function in a different file!
    
    %PART B(i): find the lowest energy path in the image
    %pix describes the seam to be removed. It is a list of columns indices 
    %for the element that should be removed in each row of the image
    pix = findSeam_Greedy(G); %Create this function in a different file!
    
    %Part B(ii): Comment out the above line and replace it with this:
    %pix = findSeam_Dyn(G); %Create this function in a different file!
    
    %Remove the seam you found in parts b or c
    for row=1:size(img,1)
       img(row,pix(row):end-1,:)=img(row,pix(row)+1:end,:);
    end
     img(:,end,:)=[];
 end

imshow([img orig_img]);

end
