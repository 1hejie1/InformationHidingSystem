%DCT��ȡ������Ϣ�㷨

%clc;
%clear;
%key=2;%key����Կ
global flag
global g
%����ԭʼ������Ϣͼ��
%file_name='best.bmp';
%message=imread(file_name);
message=im_message;
[r_message,l_message]=size(message);
message_vector=reshape(message,r_message*l_message,1);
info_hidden=zeros(size(message_vector));

%����Ƕ��������Ϣ��ͼ��
%s_cover=imread('info_hidden_image.bmp');
s_cover=info_hidden_image;
[r_cover,l_cover]=size(s_cover);
s_cover=double(s_cover)/255;

rand('state',key_2);
randno=randperm(r_cover*l_cover/64);
%fid=fopen(pfile,'w');
h=waitbar(0,'����ʹ��DCT�㷨��ȡ������Ϣͼ����ȴ�');

T=dctmtx(8);
dctg=blkproc(s_cover,[8 8],'P1*x*P2',T,T');

n=r_message*l_message;

for i=1:(n/8)
  
    for j=1:8
        waitbar(((i-1)*8)/(length(message_vector)),h);
        %��ȡ�漴�����е�ĳһ��ֵ
        value=randno((i-1)*8+j)-1;
        row=floor(value/64)*8+1;
        col=mod(value,64)*8+1;
        
        if dctg(row+4,col+1)>dctg(row+3,col+2)
            info_hidden((i-1)*8+j,1)=1;
            %fwrite(fid,1,'ubit1');
        else
            info_hidden((i-1)*8+j,1)=0;
        end
    end
    
end
close(h);
info_hidden=info_hidden';
info_hidden0=reshape(info_hidden,r_message,l_message);

%�����һ�����ϵ��Nc
%Nc=nc(message,info_hidden0)
%info_hidden0=im2bw(info_hidden0);%���Ҷ�ͼ��ת��Ϊ��ֵͼ��
%imwrite(info_hidden0,'info_recover_image.bmp','bmp');%%%����ָ����������Ϣ��ֵͼ��
if flag==1
    info_hidden0=uint8(info_hidden0);
    for i=1:r_message
        e(1,i)=bi2de(info_hidden0(i,1:8));
    end
    g=native2unicode(e);
     messagestr={'����������Ϣ�ǣ�';''; g};
    msgbox(messagestr,'��ȡ��������Ϣ');
elseif flag==0  
figure
subplot(1,2,1)
imshow(info_hidden0,[]);
title('DCT�㷨��ȡ��������Ϣͼ��');
subplot(1,2,2)
imshow(message,[]);
title('ԭʼ������Ϣͼ��');

info_hidden0=im2bw(info_hidden0*255);%���Ҷ�ͼ��ת��Ϊ��ֵͼ��
imwrite(info_hidden0,'info_recover_image.bmp','bmp');%%%����ָ����������Ϣ��ֵͼ��
end
%fclose(fid);

