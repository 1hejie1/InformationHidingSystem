%X=imread('Lena.bmp');
X=im_cover;
%计算原始图像直方图数据
L=256;         %灰度级
nk=zeros(L,1);
[row,col]=size(X);
for i=1:row
    for j=1:col
        num=double(X(i,j))+1;%获取像素点灰度级
        nk(num)=nk(num)+1;%统计nk
    end
end
%计算密写后图像直方图数据
Y=imread('info_hidden_image.bmp');
nk1=zeros(L,1);
[row,col]=size(Y);
for i=1:row
    for j=1:col
        num=double(Y(i,j))+1;%获取像素点灰度级
        nk1(num)=nk1(num)+1;%统计nk1
    end
end
%计算原始图像和密写后图像的差异
Z=zeros(row,col);
for i=1:row
    for j=1:col
        if X(i,j)==Y(i,j)
            Z(i,j)=1;
        end
    end
end
%画图
figure
x=0:255;
plot(x,nk,'b-',x,nk1,'r--');
legend('原始图像','密写后图像');
title('原始图像和密写图像直方图对比');
figure
plot(x,nk1-nk,'go');
title('原始图像和密写图像直方图差异统计');
figure
imshow(Z);
title('原始图像和密写图像差异对比');



