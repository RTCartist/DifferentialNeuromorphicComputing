% 读取灰度图像
% m = 36;
% n = 48;
% m = 30;
% n = 40; greycut1
% m = 45;
% n = 60;
m = 20;
n = 20;
folder_path = 'F:\visualpredict\2\cutpic\';
store_img_path = 'F:\visualpredict\2\greycut\img\';
store_matrix_path = 'F:\visualpredict\2\greycut\matrix\';
file_names = dir(fullfile(folder_path,'*.jpg'));
for k = 1:length(file_names)

    img = imread(fullfile(folder_path,file_names(k).name));
    
    % 获取图像的行和列数
    [rows, cols] = size(img);
    % 计算每个块的行数和列数
    block_rows = floor(rows / m);
    block_cols = floor(cols / n);
    
    % 创建一个空矩阵来存储重构后的图像
    reconstructed_img = zeros(block_rows, block_cols);
    
    % 循环遍历每个块
    for i = 1:block_rows
        for j = 1:block_cols
            % 计算当前块的左上角和右下角像素的位置
            block_start_row = (i - 1) * m+ 1;
            block_end_row = i * m;
            block_start_col = (j - 1) * n + 1;
            block_end_col = j * n;
    
            % 从原始图像中提取当前块
            block = img(block_start_row:block_end_row, block_start_col:block_end_col);
    
            % 计算当前块的平均灰度值
            block_mean = round(mean(block(:)));
    
            % 在重构图像中为当前块设置灰度值
            reconstructed_img(i, j) = block_mean;
        end
    end
    new_img_name = fullfile(store_img_path,['img_',file_names(k).name]);
    % 显示重构后的图像
    imshow(reconstructed_img, [0 255]);
    new_matrix_name = fullfile(store_matrix_path,['mat_',file_names(k).name,'.txt']);
    writematrix(reconstructed_img,new_matrix_name);
    % min_val = min(reconstructed_img(:));
    % max_val = max(reconstructed_img(:));
    reconstructed_img = (reconstructed_img - 0) / (255 - 0);
    % reconstructed_img = imadjust(reconstructed_img, [0 255], [0 1]);
    imwrite(reconstructed_img, new_img_name);
end