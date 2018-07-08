% ��������ͼ��
X=im_cover; %��СΪ512*512
X=double(X);
[m,n]=size(X);

% ����������Ϣͼ��
message=im_message;

% ������Ϣͼ�������������
[r_message,l_message]=size(message);	

% ��������Ϣͼ��ת��Ϊ��ֵ����
L=r_message*l_message;
mess=reshape(message,1,r_message*l_message);

%�ж������Ƿ��㹻
if (r_message*l_message) > (m*n)
    errordlg('ҪǶ����Ϣ�������޷�Ƕ�룡');
    error();
end;

total=0;
h=waitbar(0,'����ʹ��LHA�㷨Ƕ��������Ϣͼ����ȴ�');

%��α������ߵķ�ʽ��������Ϣ��ÿһ���ض�Ӧ��ԭʼͼ���һ�����أ���Ϣ˳��ֱ�Ӷ�Ӧ��Y�����أ��൱��α����Ķ�Ӧ��X�е�����
[coor]=myperm(m,n,key_1);   %�����ӳ���myperm

for i=1:m
    waitbar(i/m,h);
    for j=1:n
        Y(i,j)=X(coor((i-1)*n+j,1),coor((i-1)*n+j,2));
    end
end

%��256���Ҷȼ��ֱ�ͳ����ͱ�������Ƕ����ز�ͬ�����ظ������õ�����g
g=zeros(255,1);   
g0=0;
for i=1:255   
    g(i)=0;
end
pm=1;     %������Ϣ��������
cm=1;    
%�����������Ϣ����������ռ���к���
if mod(L,n)==0
    row=L/n;
    col=n;
else
    row=floor(L/n)+1;
    col=mod(L,n);
end


%���ÿ���Ҷȼ���ı�����ظ���g(j)������C��¼�����ǵ�����,���е�һ
%�б�ʾ�Ҷ�ֵ
for i=1:(row-1)
    for j=1:n
      % waitbar(((i-1)*n+j)/((row-1)*n),h);
        if mod(Y(i,j),2)~=mess(pm)
            if Y(i,j)==0
                g_0=g_0+1;
                C(cm,1:3)=[0 i j];
                total=total+1;
            else
                g(Y(i,j))=g(Y(i,j))+1;
                C(cm,1:3)=[Y(i,j) i j];
                total=total+1; 
            end
            cm=cm+1;
       end
       pm=pm+1;
    end
end

i=row;
for j=1:col
    if mod(Y(i,j),2)~=mess(pm)
        if Y(i,j)==0
            g_0=g_0+1;
            C(cm,1:3)=[0 i j];
            total=total+1;
        else
            g(Y(i,j))=g(Y(i,j))+1;
            C(cm,1:3)=[Y(i,j) i j];
            total=total+1; 
        end
        cm=cm+1;
   end
   pm=pm+1;
end

cm=cm-1;
pm=pm-1;
%���õ���C����һ�е�ֵ��С�������еõ�CC��������ͬ�Ҷ�ֵ�����ؼ���%��һ��;
[ignore,sort_C]=sort(C(:,1));    
for i=1:cm
    
    CC(i,1:3)=C(sort_C(i),1:3);
end

%����������������x0,x1,....x255
M=zeros(256,256);
for i=1:256
    for j=1:256
        if i==1
            M(i,2)=1;
        else if i==256
                M(i,255)=-1;
            else
                M(i,i-1:i+1)=[-1 0 1];
            end
        end
    end
end
for j=1:128
    M(257,2*j-1:2*j)=[1 -1];
end
S=g0-g(1);
for i=1:127
    S=S+g(2*i)-g(2*i+1);
end
S=S/2;
for i=1:257
    if i==1
        v(i)=g0;
    else if i==2
            v(i)=g(i-1)-g0;
        else if i==257
                v(i)=S;
            else
                v(i)=g(i-1)-g(i-2);
            end
        end
    end
end
v=v';
Xt=inv(M'*M)*(M'*v);     %��÷��������С���˽�
for i=0:255
    if i==0
        x0=0;
    else if i==255
             x(255)=g(255);
        else
            x(i)=Xt(i+1);
            if x(i)<0
                x(i)=0;
            else if x(i)>g(i)
                    x(i)=g(i);
                else
                    x(i)=floor(x(i));
                end
            end
        end
    end
end
%��ÿһ���Ҷȼ�j����g(j)����Ҫ�����Ҷ�ֵ�����������ѡ��x(j)�����ؽ�%�Ҷ�ֵ��1��������(g(j)-x(j))�����صĻҶ�ֵ��1������g Ϊ������
if j==0
    if g0~=0
        sel=randperm(g_0);
        for i=1:g0
            if i<=x0
       Y(CC(sel(i),2),CC(sel(i),3))=Y(CC(sel(i),2),CC(sel(i),3))-1;
            else
Y(CC(sel(i),2),CC(sel(i),3))=Y(CC(sel(i),2),CC(sel(i),3))+1;
            end
        end
    end
end

for j=1:255
    
    if g(j)~=0
        sel=randperm(g(j));
        temp_0=find(j==CC(:,1));  %������
        temp_1=temp_0(1);
        for i=temp_1:(temp_1+g(j)-1)
            if any(i==sel(1:x(j)))
                Y(CC(i,2),CC(i,3))=Y(CC(i,2),CC(i,3))-1;
            else
                Y(CC(i,2),CC(i,3))=Y(CC(i,2),CC(i,3))+1;
            end
        end
    end
end
%��ԭԭ˳���ͼ��
for i=1:m
    for j=1:n
        Y2(coor((i-1)*n+j,1),coor((i-1)*n+j,2))=Y(i,j);
    end
end
Y=Y2;
close(h);

X=uint8(X);
Y=uint8(Y);
figure
subplot(1,2,1);
imshow(X);     %��ʾԭʼͼ��
title('ԭʼͼ��');
subplot(1,2,2);
imshow(Y); %��ʾ��дͼ��
title('ʹ��LHA�㷨������Ϣ���ͼ��');
imwrite(Y,'info_hidden_image.bmp','bmp');