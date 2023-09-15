clc;close all;clear;

addpath('Databases\')
addpath('code\')
dataset_name = 'Win5'; % optimal: Win5, NBU, SHU
[all_info, sceneNum, dataset_path] = get_info_from_database(dataset_name);
mappingtable = getmapping(8,'riu2').table;
features = zeros(sceneNum, 100);

for iScene = 1 : sceneNum
    
    % load distorted LFIs
    fprintf('Distorted LFI No.%d, Name: %s \n', iScene, all_info{6}{iScene});
    dis_LF = get_LFI_from_database(dataset_name, iScene, dataset_path, all_info);
    dis_LF = uint8(dis_LF);

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
    features(iScene,:) = get_SATV_BLiF_features(gray_dis_LF, mappingtable);
    toc
    
end
save([dataset_name, '_SATV_BLiF.mat'], 'features');




