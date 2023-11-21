clc;
clear all;
close all;

sta_point_row = 1;
sta_point_col = 1;
fin_point_row = 900;
fin_point_col = 1920;

%% batch_file
folder_path = 'F:\visualpredict\2\originpic\';
store_cut_path = 'F:\visualpredict\2\cutpic\';

store_mark_path = strcat('F:\carvideo\lightinnight\markpic\',num2str(rol_mark),'_',num2str(col_mark));
file_names =  dir(fullfile(folder_path,'*.jpg'));
for k = 1:length(file_names)
    pic_origin_cache = imread(fullfile(folder_path,file_names(k).name));
    pic_cut_cache = rgb2gray(pic_origin_cache);
 
    pic_cut_cache = pic_cut_cache(sta_point_row:fin_point_row,sta_point_col:fin_point_col,:);
    imwrite(pic_cut_cache,fullfile(store_cut_path,file_names(k).name));
end
