% DWT数字秘密信息图像提取
%clear crl;
%clear all;
global flag
global g
%key=2;
blocksize=8; %图像分块大小
Th=30;

% 读入嵌入数字秘密信息图像的图像
%file_name='info_hidden_image.bmp';
%info_hidden_image0=imread(file_name);
info_hidden_image0=info_hidden_image;
[r_info_hidden,l_info_hidden]=size(info_hidden_image0);
info_hidden_image=double(info_hidden_image0);

% 读入原始秘密信息图像
%file_name='best.bmp';
%message=imread(file_name);
message=im_message;
[r_message,l_message]=size(message);
message_vector=reshape(message,1,r_message*l_message);
info_hidden=zeros(size(message_vector));

%rand('state',key_2);%由密钥得到生成为随机序列的种子
%randno=randperm(r_info_hidden*l_info_hidden/(blocksize^2));

% 将图像分块,提取秘密信息图像
h=waitbar(0,'正在使用DWT算法提取秘密信息图像，请等待');
x=1;y=1;
for kk=1:length(message_vector)
    %value=randno(kk)-1;
    %x=floor(value/64)*8+1;
    %y=mod(value,64)*8+1;

    
    w=info_hidden_image(x:x+blocksize-1,y:y+blocksize-1);
    [cA1,cH1,cV1,cD1]=dwt2(w,'haar');
    [cA2,cH2,cV2,cD2]=dwt2(cA1,'haar');
    ch2=reshape(cH2,1,(blocksize^2)/16); %二级haar小波变换
    cv2=reshape(cV2,1,(blocksize^2)/16);
    cd2=reshape(cD2,1,(blocksize^2)/16);
    c=[ch2,cv2,cd2];
    s=sum(c); %二级细节子图的小波系数的和
    if s<Th  %当二级细节子图的小波系数的和小于阀值,秘密信息图像信息判定为1
        info_hidden(kk)=1;
    elseif s>=Th %当二级细节子图的小波系数的和大于或等于阀值,秘密信息图像信息判定为0
        info_hidden(kk)=0;
    end;
    if (x+blocksize) >= r_info_hidden
        x=1;
        y=y+blocksize;
    else
        x=x+blocksize;
    end;
    waitbar(kk/length(message_vector),h);
end;
close(h);

% info_hidden0表示提取的秘密信息图像
info_hidden0=reshape(info_hidden,r_message,l_message);
rand('state',key_2);
key_matrix=round(rand(r_message,l_message));
info_hidden0=mod(info_hidden0+key_matrix,2);
if flag==1
    for i=1:r_message
        e(1,i)=bi2de(info_hidden0(i,1:8));
    end
    g=native2unicode(e);
    messagestr={'秘密文字信息是：';''; g};
    msgbox(messagestr,'提取的秘密信息');
elseif flag==0 
figure
subplot(1,2,1)
imshow(info_hidden0,[]);
title('DWT算法提取的秘密信息图像');
subplot(1,2,2)
imshow(message,[]);
title('原始秘密信息图像');

info_hidden0=im2bw(info_hidden0*255);%将灰度图像转换为二值图像
imwrite(info_hidden0,'info_recover_image.bmp','bmp');%%%保存恢复后的秘密信息二值图像
end

