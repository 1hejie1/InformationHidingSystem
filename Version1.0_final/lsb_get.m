%clear;clc;

%file_name='info_hidden_image.bmp';
%info_hidden_image=imread(file_name);


%����ԭʼ������Ϣͼ��
%file_name='best.bmp';
message=im_message;
[r_message,l_message]=size(message);
message_vector=reshape(message,r_message*l_message,1);
info_hidden=zeros(size(message_vector));

%����Ƕ��������Ϣ��ͼ��
cover_image=uint8(info_hidden_image);
% ��д���ͼ�������������
r_cover=size(cover_image,1);	%����
l_cover=size(cover_image,2);	%����
recover_image=zeros(1,r_message*l_message);

rand('state',key_2);
randno=randperm(r_cover*l_cover);

h=waitbar(0,'����ʹ��LSB�㷨��ȡ������Ϣͼ����ȴ�');

%fid=fopen(pfile,'w');

for i=1:(r_message*l_message)
    waitbar(i/(r_message*l_message),h);
    value=randno(1,i);
        row=ceil(value/l_cover);%�����������������ֵ��Ӧ��������ͼ���е���λ��
        col=mod(value,l_cover);%�����������������ֵ��Ӧ��������ͼ���е���λ��
        if col==0
            col=l_cover;%���ȡģ������Ϊ0,��Ϊ���һ��
        end
       recover_image(1,i)=bitget(cover_image(row,col),1); %ȡ����ѡ���ص�����λ��ֵ����Ϊ������Ϣ����Ӧλֵ
end
close(h);
recover_image=reshape(recover_image,r_message,l_message);

%�����һ�����ϵ��Nc
%Nc=nc(message,watermark0)

figure
subplot(1,2,1)
imshow(recover_image);
title('LSB�㷨��ȡ��ȡ��������Ϣͼ��');
subplot(1,2,2)
imshow(message,[]);
title('ԭʼ������Ϣͼ��');


info_hidden=im2bw(recover_image*255);%���Ҷ�ͼ��ת��Ϊ��ֵͼ��
imwrite(info_hidden,'info_recover_image.bmp','bmp');%%%����ָ����������Ϣ��ֵͼ��
