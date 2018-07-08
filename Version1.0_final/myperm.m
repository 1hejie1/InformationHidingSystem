function [ coor ] = myperm( m,n,key )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

rand('state',key);
x=rand(m,n);
xx=reshape(x,m*n,1);%对m*n的随机系列矩阵转换成m*n行1列矩阵XX
[sort_a,sort_b]=sort(xx);%对xx进行升序排序，sort_a是新产生的序列矩阵，sort_b是sort_a元素对应在原矩阵中的位置矩阵
y=(reshape(sort_a,m,n))';
coor=zeros(m*n,2);
%%%%%%%row_x是
for i=1:m*n
    
    if mod(sort_b(i),m)==0
        row_x=m;
    else
        row_x=mod(sort_b(i),m);
    end
    col_x=ceil(sort_b(i)/m);
    coor(i,:)=[row_x,col_x]; %存放y矩阵元素在原来rand矩阵中的行列位置
end

