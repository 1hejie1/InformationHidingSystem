%%滤波
%myaxes
axes(findobj(gcf,'Tag','axes2')); %调用坐标2显示加滤波图像

if    get(handles.radiobutton32,'value') 
      %figure
      imshow(info_hidden_image)  
      title('无经过滤波的带秘密信息的图像');
elseif  get(handles.radiobutton19,'value') 
       %中值滤波
       info_hidden_image=medfilt2(info_hidden_image,[3 3]); 
      % figure
       imshow(info_hidden_image)  
       title('经过中值滤波的带秘密信息的图像');
elseif  get(handles.radiobutton20,'value') 
       %均值滤波
       filter_temp=fspecial('average',3);
       info_hidden_image=filter2(filter_temp,info_hidden_image);
       %disp(info_hidden_image)  %测试
       %info_hidden_image=info_hidden_image/255;
       %%因为info_hidden_image是double型，要转成在0-1之间的值才能用imshow显示
       info_hidden_image=uint8(info_hidden_image);
       %figure
       imshow(info_hidden_image)  %显示受滤波的带秘密信息的图像
       title('经过均值滤波的带秘密信息的图像');
elseif   get(handles.radiobutton21,'value')          
       %高通滤波,使用近似二维拉普拉斯运算滤波器
        info_hidden_image=double(info_hidden_image);   
        %filter_temp=[1 1 1;1 1 1 ;1 1 1]/9;
        filter_temp= fspecial('laplacian');
        info_hidden_image=filter2(filter_temp,info_hidden_image);
        info_hidden_image=uint8(info_hidden_image);
       % figure
        imshow(info_hidden_image)  %显示受滤波处理的带秘密信息的图像
        title('经过高通滤波的带秘密信息的图像');
elseif   get(handles.radiobutton22,'value') 
        %理想低通滤波
  
        [f1,f2]=freqspace(size(info_hidden_image),'meshgrid');%生成频率序列矩阵
        %D=0.1;%截止频率
        %n=11120;
        Hd=ones(size(info_hidden_image));%构造低通滤波器的大小
        r=sqrt(f1.^2+f2.^2);%构造低通滤波器的决策函数
        Hd(r>0.5)=0;%构造低通滤波器，截止频率为0.4
        %for i=size(info_hidden_image,1)
       %     for j=1:size(info_hidden_image,2)
       %         t=r(i,j)/(D*D);
       %         Hd(i,j)=1/(t^n+1);%构造滤波函数
       %     end
        %end
        Y=fft2(double(info_hidden_image));%进行傅里叶变换
        Y=fftshift(Y);%频谱平移
        Ya=Y.*Hd;%低通滤波器
        Ya=ifftshift(Ya);%傅里叶反变换
        info_hidden_image=ifft2(Ya);
        info_hidden_image=uint8(info_hidden_image);
        %figure
        imshow(info_hidden_image)  %显示受滤波处理的带秘密信息的图像
        title('经过理想低通滤波器的带秘密信息的图像');
        
elseif  get(handles.radiobutton26,'value') 
            %锐化滤波
         info_hidden_image=double(info_hidden_image);  
         filter_temp=[0 1 0;1 -4 0;0 1 0];
         contain_marker_temp=conv2(info_hidden_image,filter_temp,'same');
         info_hidden_image=info_hidden_image-contain_marker_temp;
         info_hidden_image=uint8(info_hidden_image);
        % figure
         imshow(info_hidden_image)  %显示受滤波处理的带秘密信息的图像
         title('经过均值滤波的带秘密信息的图像');
elseif   get(handles.radiobutton33,'value') 
        %模糊对比增强滤波
        info_hidden_image=double(info_hidden_image);
        filter_temp= fspecial('unsharp'); 
        %filter_temp=[1 1 1;1 2 1 ;1 1 1]/10;
        info_hidden_image=filter2(filter_temp,info_hidden_image);
        info_hidden_image=uint8(info_hidden_image);
        %figure
        imshow(info_hidden_image)  %显示受噪声攻击的带秘密信息的图像
        title('经过模糊对比增强滤波的带秘密信息的图像');
elseif   get(handles.radiobutton36,'value') 
         %马赛克攻击
         [row,col]=size(info_hidden_image);
         r=2;
         for i=1:r:row
             for j=1:r:col
                 C(i:min(i+r-1,row),j:min(j+r-1,col))=mean2(info_hidden_image(i:min(i+r-1,row),j:min(j+r-1,col)));
             end
         end
         info_hidden_image=uint8(C);
         imshow(info_hidden_image)  %显示受滤波处理的带秘密信息的图像
         title('经过马赛克攻击的带秘密信息的图像');
elseif   get(handles.radiobutton37,'value') 
         %JPEG压缩攻击  
          imwrite(info_hidden_image,'info_hidden_image.jpg','quality',80);
          info_hidden_image=imread('info_hidden_image.jpg');
          imshow(info_hidden_image);
          title('经过JPEG压缩处理的带秘密信息的图像');
elseif   get(handles.radiobutton38,'value') 
         %剪切攻击,剪掉中间1/16区域
         [r1,c1]=size(info_hidden_image);
         info_hidden_image(r1/2-r1/8:r1/2+r1/8,c1/2-c1/8:c1/2+c1/8)=255;
         imshow(info_hidden_image) 
         title('经过剪切的带秘密信息的图像');  
elseif   get(handles.radiobutton47,'value') 
        %理想高通滤波
        
        [f1,f2]=freqspace(size(info_hidden_image),'meshgrid');%生成频率序列矩阵
        %D=0.1;%截止频率
        %n=11120;
        Hd=ones(size(info_hidden_image));
        r=sqrt(f1.^2+f2.^2);
        Hd(r<0.5)=0;
       
        Y=fft2(double(info_hidden_image));
        Y=fftshift(Y);
        Ya=Y.*Hd;
        Ya=ifftshift(Ya);
        info_hidden_image=ifft2(Ya);
        info_hidden_image=uint8(info_hidden_image);
        %figure
        imshow(info_hidden_image)  
        title('经过理想高通滤波器的带秘密信息的图像');
end

