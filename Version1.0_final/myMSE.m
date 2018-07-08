%%%%myMSE.m%%%%  
%������:����������Ϣ����ϵͳ�Ĳ��ɼ���
A=im_cover;
%�жϺ��������Ƿ����
if exist('info_hidden_image.bmp','file')==0
    errordlg('����ʧ�ܣ����Ƚ���Ƕ�����!');
    error();
end
B=imread('info_hidden_image.bmp');
A=double(A);
B=double(B);
%%%�ж϶����ͼ���Ƿ���Ч
[m,n]=size(A);
[m1,n1]=size(B);
if m1~=m||n1~=n
    errordlg('����ʧ��');
    error();
end
%%%����MSE
msevalue=0;
for i=1:m
    for j=1:n
        msevalue=msevalue+(A(i,j)-B(i,j))^2;
    end
end
msevalue=msevalue/(m*n);
MSEstr=['MSE=',num2str(msevalue)];
msgbox(MSEstr)