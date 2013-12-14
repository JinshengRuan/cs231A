%This script helps you to debug your computeEnergy function.
img = imread('parta_sampleinput.jpg');
%Call your function here.
g = ComputeEnergy_sol(img);
%Load the sample output.
load('parta_sampleoutput.mat');
disp('The sum of error compared to pre-computed energy is: ');
%Show the difference.
disp(sum(sum(abs(G-g))));
