%%%%myBER.m%%%%%
%计算误码率

A=message_recover;
B=im_message;
%%%判断读入的图像是否有效
[m,n]=size(A);
[m1,n1]=size(B);
if m1~=m||n1~=n
    errordlg('处理失败!');
    error();
end
%%%计算MSE
bervalue=0;
for i=1:m
    for j=1:n
        if A(i,j)~=B(i,j)
        bervalue=bervalue+1;
        end
    end
end
bervalue=bervalue/(m*n);
BERstr=['BER=',num2str(bervalue)];
msgbox(BERstr)