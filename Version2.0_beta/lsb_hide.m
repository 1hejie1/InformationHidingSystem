%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%B06022120�ν����  LSB��Ϣ����
%�㷨������
%1��ͼ��DCT��Ϣ�����㷨��
%a. ʹ�ô���Կ������㷨����һ��α������У�ÿ�����ѡ��һ�����ص���������Ϣ��
%b. ʹ��bitset������ʹ��ѡ������ص�������Чλ�óɶ�ֵ������Ϣ�Ķ�Ӧֵ

%2��ͼ��DCT��Ϣ��ȡ�㷨��
%a. ʹ�ô���Կ������㷨����һ��α������У�ÿ�����ѡ��һ�����ص�����ȡ������Ϣ��
%b. ʹ��bitget�����������ѡ������ص�������Чλ��ֵ��Ϊ��ֵ������Ϣ�Ķ�Ӧֵֵ

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ��������ͼ��
%file_name='lena.bmp';
%cover_object=imread(file_name);
cover_object=im_cover;
% ����ͼ�������������
r_cover=size(cover_object,1);	%����
l_cover=size(cover_object,2);	%����

% ����������Ϣͼ��
%file_name='best.bmp';
%message0=imread(file_name);
message0=im_message;

% ������Ϣͼ�������������
r_message=size(message0,1);	%����
l_message=size(message0,2);	%����
% ��������Ϣͼ��ת��Ϊ��ֵ����
message=reshape(message0,1,r_message*l_message);
len_msg=length(message);

info_hidden_image=uint8(cover_object);
% ��������������Կ
%key=25;

%�ж������Ƿ��㹻
if r_message*l_message > (r_cover*l_cover)
    errordlg('ҪǶ����Ϣ�������޷�Ƕ�룡');
    error();
end;
%��key��ʼ���������漴����
rand('state',key_1);
randno=randperm(r_cover*l_cover);%���������1��r_cover*l_cover/64֮�䲻�ظ�����������

h=waitbar(0,'����ʹ��LSB�㷨Ƕ��������Ϣͼ����ȴ�');

for i=1:(r_message*l_message)
    waitbar(i/len_msg,h);
    value=randno(1,i);
        row=ceil(value/l_cover);%�����������������ֵ��Ӧ��������ͼ���е���λ��
        col=mod(value,l_cover);%�����������������ֵ��Ӧ��������ͼ���е���λ��
        if col==0
            col=l_cover;%���ȡģ������Ϊ0,��Ϊ���һ��
        end
       info_hidden_image(row,col)=bitset(info_hidden_image(row,col),1,message(1,i)); %����ѡ���ص�����λֵ��Ϊ��ֵ������Ϣ����Ӧλֵ
end
close(h);
%%%%%��Ϣд�ر���%
imwrite(info_hidden_image,'info_hidden_image.bmp','bmp');

figure
subplot(121),imshow(cover_object),title('ԭͼ��');
subplot(122),imshow(info_hidden_image),title('ʹ��LSB�㷨������Ϣ���ͼ��');


