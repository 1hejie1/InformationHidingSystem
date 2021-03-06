%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%B06022120何杰  myMSE
%%均方差:用于评价信息隐藏系统的不可见性
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=im_cover;
%判断含密载体是否存在
if exist('info_hidden_image.bmp','file')==0
    errordlg('处理失败，请先进行嵌入操作!');
    error();
end
B=imread('info_hidden_image.bmp');
A=double(A);
B=double(B);
%%%判断读入的图像是否有效
[m,n]=size(A);
[m1,n1]=size(B);
if m1~=m||n1~=n
    errordlg('处理失败');
    error();
end
%%%计算MSE
msevalue=0;
for i=1:m
    for j=1:n
        msevalue=msevalue+(A(i,j)-B(i,j))^2;
    end
end
msevalue=msevalue/(m*n);
MSEstr=['MSE=',num2str(msevalue)];
msgbox(MSEstr,'均方差')
