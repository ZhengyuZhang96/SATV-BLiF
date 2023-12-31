function dis_LF = get_LFI_from_database(dataset_name, iScene, dataset_path, all_info)

if isequal(dataset_name,'Win5')
    dis_img_path = [dataset_path, all_info{6}{iScene}];
    dis_LF = imread(dis_img_path);
    size_lf = size(dis_LF);
    if eq(size_lf(1),size_lf(2)) 
        dis_LF = permute(reshape(dis_LF,[9, 512, 9, 512, 3]),[1,3,2,4,5]); 
    else
        dis_LF = permute(reshape(dis_LF,[9, 434, 9, 625, 3]),[1,3,2,4,5]); 
        dis_LF = dis_LF(:,:,2:434,2:624,:);
    end
elseif isequal(dataset_name,'NBU')
    dis_img_path = [dataset_path, all_info{6}{iScene}];
    if isequal(all_info{3}{iScene},'Real')
        dis_LF = zeros(9,9,434,625,3);
    else
        dis_LF = zeros(9,9,512,512,3);
    end
    for x = 1:9
        for y = 1:9
            dis_single_image = imread([dis_img_path,'\00',num2str(x-1),'_00',num2str(y-1),'.png']);
            dis_LF(y,x,:,:,:) = dis_single_image;
        end
    end
    if isequal(all_info{3}{iScene},'Real')
        dis_LF = dis_LF(:,:,2:434,2:624,:);
    end
elseif isequal(dataset_name,'SHU')
    dis_img_path = [dataset_path, all_info{6}{iScene}];
    dis_LF = load(dis_img_path).im2;
    dis_LF = dis_LF(4:12,4:12,2:434,2:624,:);
else
    error('The input database name is not included');
end