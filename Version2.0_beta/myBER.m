%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%B06022120�ν�  myBER
%%����������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global flag
global answer
global g
bervalue=0;
if flag==1       %����Ƕ������ʱ��������
    disp(g)
    if isempty(answer)||isempty(answer{1,1})
        errordlg('����ִ��Ƕ�������');
        error();
    end
    if isempty(g)
        errordlg('����ִ����ȡ������');
        error();
    end
    if length(answer{1,1})~=length(g)
        errordlg('����ʧ�ܣ�');
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
%%%�ж϶����ͼ���Ƿ���Ч
[m,n]=size(A);
[m1,n1]=size(B);
if m1~=m||n1~=n
    errordlg('����ʧ��!');
    error();
end
%%%����MSE

for i=1:m
    for j=1:n
        if A(i,j)~=B(i,j)
        bervalue=bervalue+1;
        end
    end
end
bervalue=bervalue/(m*n);
else 
    errordlg('����ʧ�ܣ�');
    error();
end

BERstr=['BER=',num2str(bervalue)];
msgbox(BERstr,'������')
