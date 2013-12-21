function [BH,mean_dist]=compute_shape_context(Bsamp,mean_dist,nbins_theta,nbins_r,r_inner,r_outer,out_vec);
% [BH,mean_dist]=compute_shape_context(Bsamp,Tsamp,mean_dist,nbins_theta,nbins_r,r_inner,r_outer,out_vec);
%
% compute (r,theta) histograms for points along boundary 
%
% Bsamp is 2 x nsamp (x and y coords.)
%
% out_vec is 1 x nsamp (0 for inlier, 1 for outlier)
%
% mean_dist is the mean distance, used for length normalization
% if it is not supplied, then it is computed from the data
%
% outliers are not counted in the histograms, but they do get
% assigned a histogram
%

nsamp=size(Bsamp,2);
in_vec=out_vec==0;

%%%%%%%% YOUR CODE HERE %%%%%%%%%%%%%%%%%%
% Your are given the input in (x,y) cartesian coordinates, here your code
% should calculate the distance and angle from each point to every other
% point and convert these into polar coordinates (r, theta).  Store these
% values in r_array and theta_array
% example: r_array(i,j) and theta_array(i,j) should be the length and angle
% of the vector from sample i to sample j

% compute r,theta arrays
r_array=zeros(nsamp, nsamp); 
theta_array=zeros(nsamp, nsamp);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% create joint (r,theta) histogram by binning r_array and
% theta_array

% normalize distance by mean, ignoring outliers
if isempty(mean_dist)
   tmp=r_array(in_vec,:);
   tmp=tmp(:,in_vec);
   mean_dist=mean(tmp(:));
end
r_array_n=r_array/mean_dist;

% use a log. scale for binning the distances
r_bin_edges=logspace(log10(r_inner),log10(r_outer),nbins_r);


%%%%%%%% YOUR CODE HERE %%%%%%%%%%%%%%%%%%

% This code should populate the the radius bins using r_bin_edges as bin
% edges. For each radius bin, find the corresponding radii that fall within
% that bin and increment the corresponding histogram counts.
% The array that should be populated is r_array_q. 
% Note that each bin contains all radii within the bin's radius, so you are
% going to be double counting the radii, for example, the outermost bin
% will include radii of all of the other bins.  
r_array_q=zeros(nsamp, nsamp);

% Make sure you take note of which points are inside the outermost
% boundary, set fz=1 for all points inside the outer most boundary. 
fz = zeros(nsamp, nsamp);

% put all angles in [0,2pi) range and store in theta_array_2, this should
% be a function of theta_array
theta_array_2 = [];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% quantize to a fixed set of angles (bin edges lie on 0,(2*pi)/k,...2*pi
theta_array_q = 1+floor(theta_array_2/(2*pi/nbins_theta));

% Return the shape context descriptor
nbins=nbins_theta*nbins_r;
BH=zeros(nsamp,nbins);
for n=1:nsamp
   fzn=fz(n,:)&in_vec;
   Sn=sparse(theta_array_q(n,fzn),r_array_q(n,fzn),1,nbins_theta,nbins_r);
   BH(n,:)=Sn(:)';
end




