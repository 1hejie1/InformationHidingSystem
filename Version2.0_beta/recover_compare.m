%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%B06022120 �ν�  
%1.ԭʼ����ͼ�����ȡ������ͼ��ֱ��ͼ�Ա�
%2.ԭʼ����ͼ�����ȡ������ͼ�����Ա�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%X=imread('Lena.bmp');
X=im_message;
%����ԭʼͼ��ֱ��ͼ����
%L=2;         %�Ҷȼ�
nk0=0;
nk1=0;
[row,col]=size(X);
for i=1:row
    for j=1:col
        if X(i,j)==0
            nk0=nk0+1;
        else 
            nk1=nk1+1;
        end        
    end
end
%�ж��ļ��Ĵ���
if exist('info_recover_image.bmp','file')==0
    errordlg('����ʧ��!');
    error();
end
Y=imread('info_recover_image.bmp');
[row_1,col_1]=size(Y);
%%�ж���ͼ�����Ƿ�һ��%%%
if row_1~=row||col_1~=col
    errordlg('����ʧ��!');
    error();
end

nj0=0;nj1=0;
[row,col]=size(Y);

for i=1:row
    for j=1:col
        if Y(i,j)==0
            nj0=nj0+1;
        else
            nj1=nj1+1;
        end   
    end
end
%����ԭʼͼ�����д��ͼ��Ĳ���
Z=zeros(row,col);
for i=1:row
    for j=1:col
        if X(i,j)==Y(i,j)
            Z(i,j)=1;
        end
    end
end
%��ͼ
figure
x=[0 1];
hist_comp=[nk0 nj0 ; nk1 nj1];
bar(x,hist_comp);
title('ԭʼ����ͼ�����ȡ����ͼ��ֱ��ͼ�Ա�');
legend('ԭʼ����ͼ��ֱ��ͼ','��ȡ����ͼ��ֱ��ͼ','Location','NorthWest');
figure
imshow(Z);
title('ԭʼ����ͼ�����ȡ����ͼ�����Ա�');
