%clear;clc;

%file_name='info_hidden_image.bmp';
%info_hidden_image=imread(file_name);


%读入原始秘密信息图像
%file_name='best.bmp';
message=im_message;
[r_message,l_message]=size(message);
message_vector=reshape(message,r_message*l_message,1);
info_hidden=zeros(size(message_vector));

%读入嵌有秘密信息的图像
cover_image=uint8(info_hidden_image);
% 密写后的图像的行数和列数
r_cover=size(cover_image,1);	%行数
l_cover=size(cover_image,2);	%列数
recover_image=zeros(1,r_message*l_message);

rand('state',key_2);
randno=randperm(r_cover*l_cover);

h=waitbar(0,'正在使用LSB算法提取秘密信息图像，请等待');

%fid=fopen(pfile,'w');

for i=1:(r_message*l_message)
    waitbar(i/(r_message*l_message),h);
    value=randno(1,i);
        row=ceil(value/l_cover);%求得随机整数矩阵里的值对应于再载体图像中的行位置
        col=mod(value,l_cover);%求得随机整数矩阵里的值对应于再载体图像中的列位置
        if col==0
            col=l_cover;%如果取模运算结果为0,即为最后一列
        end
       recover_image(1,i)=bitget(cover_image(row,col),1); %取出所选像素点的最低位的值，即为秘密信息的相应位值
end
close(h);
recover_image=reshape(recover_image,r_message,l_message);

%计算归一化相关系数Nc
%Nc=nc(message,watermark0)

figure
subplot(1,2,1)
imshow(recover_image);
title('LSB算法提取提取的秘密信息图像');
subplot(1,2,2)
imshow(message,[]);
title('原始秘密信息图像');


info_hidden=im2bw(recover_image*255);%将灰度图像转换为二值图像
imwrite(info_hidden,'info_recover_image.bmp','bmp');%%%保存恢复后的秘密信息二值图像
