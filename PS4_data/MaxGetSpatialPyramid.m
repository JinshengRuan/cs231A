function feature = MaxGetSpatialPyramid(responsemap, nlevel)

%% YOU NEED TO UPDATE THIS FUNCTION
% You are given a response map (responsemap), and the number of pyramid levels (nlevel)
% and you are required to compute the appropriate OB feature. As an example, if nelvel=2,
% your code should output a feature of length 1+4=5 corresponding to level 0 and level 1 of
% the SPM representation shown in Fig. 3 of the problem set. It is possible to write a single
% function corresponding to both parts 2(b)(i) and 2(b)(ii), but if you would prefer to 
% write it in a case-by-case basis, feel free to do so. However, it might be easier to
% write the general form of the function. (Hint: You are simply concatenating the features
% from different pyramid levels together. At each pyramid level, the type of computation
% remains the same.)

% NOTE: You DO NOT need to multiply the coefficients (1/4, 1/4, 1/2) shown in Fig.3 of
% the problem set for this part.

% Declare the feature array
feature = zeros(sum(4.^(0:nlevel-1)), 1);

% ADD YOUR OWN CODE HERE!