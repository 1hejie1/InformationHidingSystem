%X=imread('Lena.bmp');
X=im_cover;
%����ԭʼͼ��ֱ��ͼ����
L=256;         %�Ҷȼ�
nk=zeros(L,1);
[row,col]=size(X);
for i=1:row
    for j=1:col
        num=double(X(i,j))+1;%��ȡ���ص�Ҷȼ�
        nk(num)=nk(num)+1;%ͳ��nk
    end
end
%������д��ͼ��ֱ��ͼ����
Y=imread('info_hidden_image.bmp');
nk1=zeros(L,1);
[row,col]=size(Y);
for i=1:row
    for j=1:col
        num=double(Y(i,j))+1;%��ȡ���ص�Ҷȼ�
        nk1(num)=nk1(num)+1;%ͳ��nk1
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
x=0:255;
plot(x,nk,'b-',x,nk1,'r--');
legend('ԭʼͼ��','��д��ͼ��');
title('ԭʼͼ�����дͼ��ֱ��ͼ�Ա�');
figure
plot(x,nk1-nk,'go');
title('ԭʼͼ�����дͼ��ֱ��ͼ����ͳ��');
figure
imshow(Z);
title('ԭʼͼ�����дͼ�����Ա�');