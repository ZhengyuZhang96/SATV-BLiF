clc;close all;clear;

addpath('code\')
addpath('demo\')
addpath('SVR\')

% load distorted LFI (EPICNN_dishes.bmp from Win5-LID database)
dis_LF = imread('EPICNN_dishes.bmp');
dis_LF = permute(reshape(dis_LF,[9, 512, 9, 512, 3]),[1,3,2,4,5]); 

tic

% convert each SAI into grayscale
[U, V, H, W, ~] = size(dis_LF);
gray_dis_LF = zeros(U, V, H, W);
for u=1:U
    for v=1:V
        gray_dis_LF(u,v,:,:) = rgb2gray(squeeze(dis_LF(u,v,:,:,:)));
    end
end

% extract SATV-BLiF features
mappingtable = getmapping(8,'riu2').table;
features = get_SATV_BLiF_features(gray_dis_LF, mappingtable);

% predict quality using the pretrained SVR model
load model
features = normalization(features,-1,1,MAX,MIN);
[predict_score, ~, ~] = svmpredict(1, features, model);
fprintf('The predicted quality score is %4f.\n', predict_score);

toc





