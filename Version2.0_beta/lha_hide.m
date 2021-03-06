%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%B06022120何杰  LHA信息隐藏

%算法描述：
%最小直方图失真（LHA）算法是LSB算法的发展，它避免了简单的LSB密写中 与 
%之间的不平衡，并尽量保持直方图不发生变化。秘密信息的每一比特都对应于
%载体的一个像素。算法详细设计请参考论文。

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 读入载体图像
X=im_cover; %大小为512*512
X=double(X);
[m,n]=size(X);

% 读入秘密信息图像
message=im_message;

% 秘密信息图像的行数和列数
[r_message,l_message]=size(message);	

% 将秘密信息图像转化为二值序列
L=r_message*l_message;
mess=reshape(message,1,r_message*l_message);

%判断载体是否足够
if (r_message*l_message) > (m*n)
    errordlg('要嵌入信息量过大，无法嵌入！');
    error();
end;

total=0;
h=waitbar(0,'正在使用LHA算法嵌入秘密信息图像，请等待');

%用伪随机游走的方式将秘密信息的每一比特对应于原始图像的一个像素，信息顺序直接对应于Y的像素，相当于伪随机的对应于X中的像素
[coor]=myperm(m,n,key_1);   %调用子程序myperm

for i=1:m
    waitbar(i/m,h);
    for j=1:n
        Y(i,j)=X(coor((i-1)*n+j,1),coor((i-1)*n+j,2));
    end
end

%在256个灰度级分别统计最低比特与欲嵌入比特不同的像素个数，得到向量g
g=zeros(255,1);   
g0=0;
for i=1:255   
    g(i)=0;
end
pm=1;     %秘密信息个数计数
cm=1;    
%计算出秘密信息在载体中所占的行和列
if mod(L,n)==0
    row=L/n;
    col=n;
else
    row=floor(L/n)+1;
    col=mod(L,n);
end


%算出每个灰度级需改变的像素个数g(j)，并用C纪录下他们的坐标,其中第一
%列表示灰度值
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
%将得到的C按第一列的值从小到大，排列得到CC，即将相同灰度值的像素集中%在一起;
[ignore,sort_C]=sort(C(:,1));    
for i=1:cm
    
    CC(i,1:3)=C(sort_C(i),1:3);
end

%按照上述方法计算x0,x1,....x255
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
Xt=inv(M'*M)*(M'*v);     %求得方程组的最小二乘解
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
%对每一个灰度级j，在g(j)个需要调整灰度值的像素中随机选择x(j)个像素将%灰度值降1，将其余(g(j)-x(j))个像素的灰度值增1，其中g 为列向量
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
        temp_0=find(j==CC(:,1));  %列向量
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
%复原原顺序的图像
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
imshow(X);     %显示原始图像
title('原始图像');
subplot(1,2,2);
imshow(Y); %显示密写图像
title('使用LHA算法隐藏信息后的图像');
imwrite(Y,'info_hidden_image.bmp','bmp');


