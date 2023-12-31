function [all_info, sceneNum, dataset_path] = get_info_from_database(dataset_name)

if isequal(dataset_name,'Win5')
    dataset_path = '...\Win5-LID\Distorted\';  % set your Win5-LID database path here
    load('Win5_all_info.mat');
    all_info = win5_all_info;
    sceneNum = 220; 
elseif isequal(dataset_name,'NBU')
    dataset_path = '...\NBU-LF1.0\dis_img\';   % set your NBU-LF1.0 database path here
    load('NBU_all_info.mat');
    all_info = NBU_all_info;
    sceneNum = 210;
elseif isequal(dataset_name,'SHU')
    dataset_path = '...\上海大学光场数据库\';   % set your SHU database path here
    load('SHU_all_info.mat');
    all_info = SHU_all_info;
    sceneNum = 240;
else
    error('The input database name is not included');
end