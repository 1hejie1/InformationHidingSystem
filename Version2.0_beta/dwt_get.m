% DWT����������Ϣͼ����ȡ
%clear crl;
%clear all;
global flag
global g
%key=2;
blocksize=8; %ͼ��ֿ��С
Th=30;

% ����Ƕ������������Ϣͼ���ͼ��
%file_name='info_hidden_image.bmp';
%info_hidden_image0=imread(file_name);
info_hidden_image0=info_hidden_image;
[r_info_hidden,l_info_hidden]=size(info_hidden_image0);
info_hidden_image=double(info_hidden_image0);

% ����ԭʼ������Ϣͼ��
%file_name='best.bmp';
%message=imread(file_name);
message=im_message;
[r_message,l_message]=size(message);
message_vector=reshape(message,1,r_message*l_message);
info_hidden=zeros(size(message_vector));

%rand('state',key_2);%����Կ�õ�����Ϊ������е�����
%randno=randperm(r_info_hidden*l_info_hidden/(blocksize^2));

% ��ͼ��ֿ�,��ȡ������Ϣͼ��
h=waitbar(0,'����ʹ��DWT�㷨��ȡ������Ϣͼ����ȴ�');
x=1;y=1;
for kk=1:length(message_vector)
    %value=randno(kk)-1;
    %x=floor(value/64)*8+1;
    %y=mod(value,64)*8+1;

    
    w=info_hidden_image(x:x+blocksize-1,y:y+blocksize-1);
    [cA1,cH1,cV1,cD1]=dwt2(w,'haar');
    [cA2,cH2,cV2,cD2]=dwt2(cA1,'haar');
    ch2=reshape(cH2,1,(blocksize^2)/16); %����haarС���任
    cv2=reshape(cV2,1,(blocksize^2)/16);
    cd2=reshape(cD2,1,(blocksize^2)/16);
    c=[ch2,cv2,cd2];
    s=sum(c); %����ϸ����ͼ��С��ϵ���ĺ�
    if s<Th  %������ϸ����ͼ��С��ϵ���ĺ�С�ڷ�ֵ,������Ϣͼ����Ϣ�ж�Ϊ1
        info_hidden(kk)=1;
    elseif s>=Th %������ϸ����ͼ��С��ϵ���ĺʹ��ڻ���ڷ�ֵ,������Ϣͼ����Ϣ�ж�Ϊ0
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

% info_hidden0��ʾ��ȡ��������Ϣͼ��
info_hidden0=reshape(info_hidden,r_message,l_message);
rand('state',key_2);
key_matrix=round(rand(r_message,l_message));
info_hidden0=mod(info_hidden0+key_matrix,2);
if flag==1
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
title('DWT�㷨��ȡ��������Ϣͼ��');
subplot(1,2,2)
imshow(message,[]);
title('ԭʼ������Ϣͼ��');

info_hidden0=im2bw(info_hidden0*255);%���Ҷ�ͼ��ת��Ϊ��ֵͼ��
imwrite(info_hidden0,'info_recover_image.bmp','bmp');%%%����ָ����������Ϣ��ֵͼ��
end

