function [ coor ] = myperm( m,n,key )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

rand('state',key);
x=rand(m,n);
xx=reshape(x,m*n,1);%��m*n�����ϵ�о���ת����m*n��1�о���XX
[sort_a,sort_b]=sort(xx);%��xx������������sort_a���²��������о���sort_b��sort_aԪ�ض�Ӧ��ԭ�����е�λ�þ���
y=(reshape(sort_a,m,n))';
coor=zeros(m*n,2);
%%%%%%%row_x��
for i=1:m*n
    
    if mod(sort_b(i),m)==0
        row_x=m;
    else
        row_x=mod(sort_b(i),m);
    end
    col_x=ceil(sort_b(i)/m);
    coor(i,:)=[row_x,col_x]; %���y����Ԫ����ԭ��rand�����е�����λ��
end
