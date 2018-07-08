%读入嵌有秘密信息的图像
Y=info_hidden_image;
pm=1;
[m,n]=size(Y);

%im_message=imread('best.bmp');
[m1,n1]=size(im_message);
%L=floor((m*n)*k);
%L=1440;
L=m1*n1;

h=waitbar(0,'正在使用LHA算法提取秘密信息图像，请等待');

[coor]=myperm(m,n,key_2);
if mod(L,n)==0;
    row=L/n;
    col=n;
else
    row=floor(L/n)+1;
    col=mod(L,n);
end

for i=1:(row-1)
    for j=1:n
    waitbar(((i-1)*n+j)/((row-1)*n),h);
    Y0(i,j)=Y(coor((i-1)*n+j,1), coor((i-1)*n+j,2));
    M1(pm,1)=bitget(Y0(i,j),1);
    pm=pm+1;
    end
end
i=row;
for j=1:col
   Y0(i,j)=Y(coor((i-1)*n+j,1), coor((i-1)*n+j,2));
   M1(pm,1)=bitget(Y0(i,j),1);
   pm=pm+1;
end
recover_image=reshape(M1,m1,n1);
recover_image=recover_image.*255;
close(h);
figure
%imshow(im_recover);
subplot(1,2,1)
imshow(recover_image);
title('LHA算法提取提取的秘密信息图像');
subplot(1,2,2)
imshow(im_message);
title('原始秘密信息图像');

info_hidden=im2bw(recover_image);%将灰度图像转换为二值图像
imwrite(info_hidden,'info_recover_image.bmp','bmp');%%%保存恢复后的秘密信息二值图像

