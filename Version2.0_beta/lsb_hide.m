%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%B06022120何杰设计  LSB信息隐藏
%算法描述：
%1、图像DCT信息隐藏算法：
%a. 使用带密钥的随机算法产生一个伪随机序列，每次随机选择一个象素点来隐藏信息；
%b. 使用bitset函数，使所选择的像素点的最低有效位置成二值秘密信息的对应值

%2、图像DCT信息提取算法：
%a. 使用带密钥的随机算法产生一个伪随机序列，每次随机选择一个象素点来提取隐藏信息；
%b. 使用bitget函数，获得所选择的像素点的最低有效位的值即为二值秘密信息的对应值值

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 读入载体图像
%file_name='lena.bmp';
%cover_object=imread(file_name);
cover_object=im_cover;
% 载体图像的行数和列数
r_cover=size(cover_object,1);	%行数
l_cover=size(cover_object,2);	%列数

% 读入秘密信息图像
%file_name='best.bmp';
%message0=imread(file_name);
message0=im_message;

% 秘密信息图像的行数和列数
r_message=size(message0,1);	%行数
l_message=size(message0,2);	%列数
% 将秘密信息图像转化为二值序列
message=reshape(message0,1,r_message*l_message);
len_msg=length(message);

info_hidden_image=uint8(cover_object);
% 随机间隔函数的密钥
%key=25;

%判断载体是否足够
if r_message*l_message > (r_cover*l_cover)
    errordlg('要嵌入信息量过大，无法嵌入！');
    error();
end;
%用key初始化并生成随即序列
rand('state',key_1);
randno=randperm(r_cover*l_cover);%产生随机的1到r_cover*l_cover/64之间不重复的整数矩阵

h=waitbar(0,'正在使用LSB算法嵌入秘密信息图像，请等待');

for i=1:(r_message*l_message)
    waitbar(i/len_msg,h);
    value=randno(1,i);
        row=ceil(value/l_cover);%求得随机整数矩阵里的值对应于再载体图像中的行位置
        col=mod(value,l_cover);%求得随机整数矩阵里的值对应于再载体图像中的列位置
        if col==0
            col=l_cover;%如果取模运算结果为0,即为最后一列
        end
       info_hidden_image(row,col)=bitset(info_hidden_image(row,col),1,message(1,i)); %将所选像素点的最低位值置为二值秘密信息的相应位值
end
close(h);
%%%%%信息写回保存%
imwrite(info_hidden_image,'info_hidden_image.bmp','bmp');

figure
subplot(121),imshow(cover_object),title('原图像');
subplot(122),imshow(info_hidden_image),title('使用LSB算法隐藏信息后的图像');


