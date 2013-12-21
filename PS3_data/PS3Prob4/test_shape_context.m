%% CS 231A PS3 Shape Context Problem 4 test script
close all;
clc
rand('seed',0)
addpath('SupportCode')

% load in the digit database (only needs to be done once per session)
if ~(exist('train_data')&exist('label_train'))
    load digit_100_train_easy;
    %   load digit_100_train_hard;
end
mm_loop = [30];
nn_loop = [15];

for i = 1:length(mm_loop)
    % choose which two digits to compare:
    mm=mm_loop(i);
    nn=nn_loop(i);
    
    %%%
    %%%Define flags and parameters:
    %%%
    display_flag=1;
    affine_start_flag=1;
    polarity_flag=1;
    nsamp=100;
    eps_dum=0.25;
    ndum_frac=0.25;
    mean_dist_global=[];
    ori_weight=0.1;
    nbins_theta=12;
    nbins_r=5;
    r_inner=1/8;
    r_outer=2;
    tan_eps=1.0;
    n_iter=6;
    beta_init=1;
    r=1; % annealing rate
    w=4;
    sf=2.5;
    
    
    %%%
    %%% image loading
    %%%
    V1=reshape(train_data(mm,:),28,28)';
    V1=imresize(V1,sf,'bil');
    V2=reshape(train_data(nn,:),28,28)';
    V2=imresize(V2,sf,'bil');
    [N1,N2]=size(V1);
    
    
    %%%
    %%% edge detection
    %%%
    [x2,y2,t2]=bdry_extract_3(V2);
    nsamp2=length(x2);
    if nsamp2>=nsamp
        [x2,y2,t2]=get_samples_1(x2,y2,t2,nsamp);
    else
        error('shape #2 doesn''t have enough samples')
    end
    Y=[x2 y2];
    
    % get boundary points
    disp('extracting boundary points...')
    [x1,y1,t1]=bdry_extract_3(V1);
    
    nsamp1=length(x1);
    if nsamp1>=nsamp
        [x1,y1,t1]=get_samples_1(x1,y1,t1,nsamp);
    else
        error('shape #1 doesn''t have enough samples')
    end
    X=[x1 y1];
    
    
    %%%
    %%% compute correspondences
    %%%
    Xk=X;
    tk=t1;
    k=1;
    s=1;
    ndum=round(ndum_frac*nsamp);
    out_vec_1=zeros(1,nsamp);
    out_vec_2=zeros(1,nsamp);
    
    disp(['iter=' int2str(k)])
    disp('computing shape contexts for (deformed) model...')
    [BH1,mean_dist_1]=compute_shape_context(Xk',mean_dist_global,nbins_theta,nbins_r,r_inner,r_outer,out_vec_1);
    disp('done.')
    % apply the scale estimate from the warped model to the test shape
    disp('computing shape contexts for target...')
    [BH2,mean_dist_2]=compute_shape_context(Y',mean_dist_global,nbins_theta,nbins_r,r_inner,r_outer,out_vec_2);
    disp('done.')
    load BH_test
    if norm(BH1(:)-BH1_test(:)) < .1
        display('Passed Test 1')
    else
        display('Did not pass Test 1')
    end
    if  norm(BH2(:)-BH2_test(:) ) < .1
        display('Passed Test 2') 
    else
        display('Did not pass Test 2')
    end
    
    
    
    
end
