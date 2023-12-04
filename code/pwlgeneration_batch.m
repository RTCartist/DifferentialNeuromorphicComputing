%% change the size of compression image 如 25 40 scale rate 为图像转换为电压倍数 delta 0.1 sta 是 matrix
%% 起始的编号

%% pwl file generation, set the length p
% mem_row_length = 25;
% mem_col_length = 40;
% 36 48
mem_row_length = 900/20;
mem_col_length = 1920/20;
read_path = 'F:\visualpredict\2\greycut\matrix';
read_file_list = dir(fullfile(read_path,'*.txt'));
pwl_store_path = 'F:\visualpredict\2\greycut\pwlreal';
scale_rate = 0.01;
time_delta = 0.1;
sta = 1;

for i = 1:mem_row_length
    for j = 1:mem_col_length
        file_pwlpath = fullfile(pwl_store_path,strcat(num2str(i),'_',num2str(j),'.txt'));
        filepwlID = fopen(file_pwlpath,'w');
        for k = 1:length(read_file_list)
            matrix_read_name = fullfile(read_path,strcat('mat_',num2str(k-1+sta),'.jpg.txt'));
            matrix_cache = readmatrix(matrix_read_name);
            % if k == 1
            %     A0 = [0,scale_rate*matrix_cache(i,j)];
            %     fprintf(filepwlID,'%f,%f\n',A0);
            % end
            % A1 = [(k-1)+time_delta,scale_rate*matrix_cache(i,j)];
            % A2 = [k,scale_rate*matrix_cache(i,j)];
            % fprintf(filepwlID,'%f,%f\n',A1);
            % fprintf(filepwlID,'%f,%f\n',A2);

            if k == 1
                A0 = [0,scale_rate*matrix_cache(i,j)];
                fprintf(filepwlID,'%f,%f\n',A0);
            else
            A1 = [(k-2)+time_delta,scale_rate*matrix_cache(i,j)];
            A2 = [k-1,scale_rate*matrix_cache(i,j)];
            fprintf(filepwlID,'%f,%f\n',A1);
            fprintf(filepwlID,'%f,%f\n',A2);
            end
        end
        fclose(filepwlID);
    end
end
