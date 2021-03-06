% DWT算法实现图像信息隐藏
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%B06022120何杰设计  2010.5.8  
%这一算法有待改进~~对称密钥系统本来打算使用与DCT一样选择随机块来
%嵌入一位的秘密信息，可惜无法提取出正确的秘密信息，由于时间的紧迫，
%暂时还没找到问题的所在以及解决的方法，所以在改用简单模2运算使图
%像混沌加密,然后嵌入顺序排列的图像块中。此方法并非优良的加密方法，
%所以也不可避免地影响了信息隐藏系统的不可见性。
%不过答辩在即，使用此方法只是权宜之计，对算法的改进有待其他
%同学，或者自己以后有时间！
%我原本设计的加密方法已经在程序中注释出来，虽有存在问题，但希望能给
%使用本程序的同学一点启示，不过但愿这启示不会起到误导的反效果：）
%如果大家能解决这一问题，或能找到更好的DWT算法，还望邮件告知一声。
%My Email：1hejie1@gmail.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clear;
%clc;

blocksize=8; %图像分块大小
A=2;b=0.3; %秘密信息图像嵌入程度的调制参数

% 读入载体图像
%file_name='lena.bmp';
%cover_object0=imread(file_name);
cover_object0=im_cover;
[r_cover,l_cover]=size(cover_object0);

%key=2;


% 读入需要隐藏的秘密图像
%file_name='best.bmp';
%message=imread(file_name);
message=im_message;
[r_message,l_message]=size(message);
%模2运算，是秘密信息图像混沌加密
rand('state',key_1);
key_matrix=round(rand(r_message,l_message));%产生伪随机序列矩阵,并取整
message=mod(message+key_matrix,2);%模2和运算，使得秘密图像乱置
message_vector=reshape(message,1,r_message*l_message);


if r_message*l_message > r_cover*l_cover/(blocksize^2)
   errordlg('要嵌入信息量过大，无法嵌入！');
   error();
end;

%rand('state',key_1);%由密钥得到生成为随机序列的种子~~出现问题的加密方法
%randno=randperm(l_cover*r_cover/(blocksize^2));

cover_object=double(cover_object0);
info_hidden_image=cover_object;

% 图像分块，嵌入秘密信息图像信息
h=waitbar(0,'正在使用DWT算法嵌入秘密信息图像，请等待');
x=1;y=1;
for kk=1:length(message_vector)
    %%%%计算出随机序列值所对应在载体图像中的行列值，出现问题的加密方法
    %value=randno(kk)-1;
    %x=floor(value/64)*8+1;
    %y=mod(value,64)*8+1;
    
    w=cover_object(x:x+blocksize-1,y:y+blocksize-1);
    [cA1,cH1,cV1,cD1]=dwt2(w,'haar');  %二级haar小波变换
    [cA2,cH2,cV2,cD2]=dwt2(cA1,'haar');
    a=[cA2,cH2,cV2,cD2];
    
    ca=reshape(a,1,(blocksize^2)/4);
    ca2=reshape(cA2,1,(blocksize^2)/16);
    ch2=reshape(cH2,1,(blocksize^2)/16);
    cv2=reshape(cV2,1,(blocksize^2)/16);
    cd2=reshape(cD2,1,(blocksize^2)/16);
    E=(sum(ca)-sum(ca2))/(16-4);   % 二级细节子图的小波系数的平均值
    c=[ch2,cv2,cd2]-E;s=0;
    for nn=1:length(c)
        s=s+c(nn)^2;
    end;
    s=sqrt(s);
    t=s^b;
    p=A+t;   % 调制参数
    if message_vector(kk)==0
        C=c+p;  
    end;
    if message_vector(kk)==1
        C=c;  
    end;
    cH2=reshape(C(1:4),2,2);
    cV2=reshape(C(5:8),2,2);
    cD2=reshape(C(9:12),2,2);
    cA1=idwt2(cA2,cH2,cV2,cD2,'haar',[blocksize/2,blocksize/2]); %二级haar小波逆变换
    info_hidden_image(x:x+blocksize-1,y:y+blocksize-1)= idwt2(cA1,cH1,cV1,cD1,'haar',[blocksize,blocksize]);
    if (x+blocksize) >= r_cover
        x=1;
        y=y+blocksize;
    else
        x=x+blocksize;
    end;
    waitbar(kk/length(message_vector),h);
end;
close(h);

% 计算PSNR
%PSNR=psnr(cover_object,info_hidden_image)

% 将嵌入秘密信息图像的图像转换成uint8，写入info_hidden_image.bmp
info_hidden_image_uint=uint8(info_hidden_image);
imwrite(info_hidden_image_uint,'info_hidden_image.bmp','bmp');

% 显示嵌入秘密信息图像的图像
figure
subplot(1,2,1);
imshow(info_hidden_image,[]);
title('DWT嵌入秘密信息的图像');
subplot(1,2,2);
imshow(cover_object,[]);
title('原载体图像');



