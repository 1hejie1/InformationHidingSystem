% DWT�㷨ʵ��ͼ����Ϣ����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%B06022120�ν����  2010.5.8  
%��һ�㷨�д��Ľ�~~�Գ���Կϵͳ��������ʹ����DCTһ����ѡ���������
%Ƕ��һλ��������Ϣ����ϧ�޷���ȡ����ȷ��������Ϣ������ʱ��Ľ��ȣ�
%����ʱ��û�ҵ�����������Լ�����ķ����������ڸ��ü�ģ2����ʹͼ
%��������,Ȼ��Ƕ��˳�����е�ͼ����С��˷������������ļ��ܷ�����
%����Ҳ���ɱ����Ӱ������Ϣ����ϵͳ�Ĳ��ɼ��ԡ�
%��������ڼ���ʹ�ô˷���ֻ��Ȩ��֮�ƣ����㷨�ĸĽ��д�����
%ͬѧ�������Լ��Ժ���ʱ�䣡
%�ұ�����Ƶļ��ܷ����Ѿ��ڳ�����ע�ͳ��������д������⣬��ϣ���ܸ�
%ʹ�ñ������ͬѧһ����ʾ��������Ը����ʾ���Ƿ�Ч������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clear;
%clc;

blocksize=8; %ͼ��ֿ��С
A=2;b=0.3; %������Ϣͼ��Ƕ��̶ȵĵ��Ʋ���

% ��������ͼ��
%file_name='lena.bmp';
%cover_object0=imread(file_name);
cover_object0=im_cover;
[r_cover,l_cover]=size(cover_object0);

%key=2;


% ������Ҫ���ص�����ͼ��
%file_name='best.bmp';
%message=imread(file_name);
message=im_message;
[r_message,l_message]=size(message);
%ģ2���㣬��������Ϣͼ��������
rand('state',key_1);
key_matrix=round(rand(r_message,l_message));%����α������о���,��ȡ��
message=mod(message+key_matrix,2);%ģ2�����㣬ʹ������ͼ������
message_vector=reshape(message,1,r_message*l_message);


if r_message*l_message > r_cover*l_cover/(blocksize^2)
   errordlg('ҪǶ����Ϣ�������޷�Ƕ�룡');
   error();
end;

%rand('state',key_1);%����Կ�õ�����Ϊ������е�����~~��������ļ��ܷ���
%randno=randperm(l_cover*r_cover/(blocksize^2));

cover_object=double(cover_object0);
info_hidden_image=cover_object;

% ͼ��ֿ飬Ƕ��������Ϣͼ����Ϣ
h=waitbar(0,'����ʹ��DWT�㷨Ƕ��������Ϣͼ����ȴ�');
x=1;y=1;
for kk=1:length(message_vector)
    %%%%������������ֵ����Ӧ������ͼ���е�����ֵ����������ļ��ܷ���
    %value=randno(kk)-1;
    %x=floor(value/64)*8+1;
    %y=mod(value,64)*8+1;
    
    w=cover_object(x:x+blocksize-1,y:y+blocksize-1);
    [cA1,cH1,cV1,cD1]=dwt2(w,'haar');  %����haarС���任
    [cA2,cH2,cV2,cD2]=dwt2(cA1,'haar');
    a=[cA2,cH2,cV2,cD2];
    
    ca=reshape(a,1,(blocksize^2)/4);
    ca2=reshape(cA2,1,(blocksize^2)/16);
    ch2=reshape(cH2,1,(blocksize^2)/16);
    cv2=reshape(cV2,1,(blocksize^2)/16);
    cd2=reshape(cD2,1,(blocksize^2)/16);
    E=(sum(ca)-sum(ca2))/(16-4);   % ����ϸ����ͼ��С��ϵ����ƽ��ֵ
    c=[ch2,cv2,cd2]-E;s=0;
    for nn=1:length(c)
        s=s+c(nn)^2;
    end;
    s=sqrt(s);
    t=s^b;
    p=A+t;   % ���Ʋ���
    if message_vector(kk)==0
        C=c+p;  
    end;
    if message_vector(kk)==1
        C=c;  
    end;
    cH2=reshape(C(1:4),2,2);
    cV2=reshape(C(5:8),2,2);
    cD2=reshape(C(9:12),2,2);
    cA1=idwt2(cA2,cH2,cV2,cD2,'haar',[blocksize/2,blocksize/2]); %����haarС����任
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

% ����PSNR
%PSNR=psnr(cover_object,info_hidden_image)

% ��Ƕ��������Ϣͼ���ͼ��ת����uint8��д��DWT_info_hidden_lena.bmp
info_hidden_image_uint=uint8(info_hidden_image);
imwrite(info_hidden_image_uint,'info_hidden_image.bmp','bmp');

% ��ʾǶ��������Ϣͼ���ͼ��
figure
subplot(1,2,1);
imshow(info_hidden_image,[]);
title('DWTǶ��������Ϣ��ͼ��');
subplot(1,2,2);
imshow(cover_object,[]);
title('ԭ����ͼ��');