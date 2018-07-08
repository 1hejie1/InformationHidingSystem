%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%B06022120何杰  myBER
%%计算误码率
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global flag
global answer
global g
bervalue=0;
if flag==1       %计算嵌入文字时的误码率
    disp(g)
    if isempty(answer)||isempty(answer{1,1})
        errordlg('请先执行嵌入操作！');
        error();
    end
    if isempty(g)
        errordlg('请先执行提取操作！');
        error();
    end
    if length(answer{1,1})~=length(g)
        errordlg('处理失败！');
        error();
    end
    for i=1:length(g)
        if g(i)~=answer{1,1}(i)
            bervalue=bervalue+1;
        end
    end
bervalue=bervalue/length(g); 
elseif flag==0      
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

for i=1:m
    for j=1:n
        if A(i,j)~=B(i,j)
        bervalue=bervalue+1;
        end
    end
end
bervalue=bervalue/(m*n);
else 
    errordlg('处理失败！');
    error();
end

BERstr=['BER=',num2str(bervalue)];
msgbox(BERstr,'误码率')
