%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%B06022120 何杰  
%1.原始秘密图像和提取出秘密图像直方图对比
%2.原始秘密图像和提取出秘密图像差异对比
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%X=imread('Lena.bmp');
X=im_message;
%计算原始图像直方图数据
%L=2;         %灰度级
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
%判断文件的存在
if exist('info_recover_image.bmp','file')==0
    errordlg('处理失败!');
    error();
end
Y=imread('info_recover_image.bmp');
[row_1,col_1]=size(Y);
%%判断两图像规格是否一样%%%
if row_1~=row||col_1~=col
    errordlg('处理失败!');
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
x=[0 1];
hist_comp=[nk0 nj0 ; nk1 nj1];
bar(x,hist_comp);
title('原始秘密图像和提取秘密图像直方图对比');
legend('原始秘密图像直方图','提取秘密图像直方图','Location','NorthWest');
figure
imshow(Z);
title('原始秘密图像和提取秘密图像差异对比');
