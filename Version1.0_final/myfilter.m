%%�˲�
%myaxes
axes(findobj(gcf,'Tag','axes2')); %��������2��ʾ���˲�ͼ��

if    get(handles.radiobutton32,'value') 
      %figure
      imshow(info_hidden_image)  
      title('�޾����˲��Ĵ�������Ϣ��ͼ��');
elseif  get(handles.radiobutton19,'value') 
       %��ֵ�˲�
       info_hidden_image=medfilt2(info_hidden_image,[3 3]); 
      % figure
       imshow(info_hidden_image)  
       title('������ֵ�˲��Ĵ�������Ϣ��ͼ��');
elseif  get(handles.radiobutton20,'value') 
       %��ֵ�˲�
       filter_temp=fspecial('average',3);
       info_hidden_image=filter2(filter_temp,info_hidden_image);
       %disp(info_hidden_image)  %����
       %info_hidden_image=info_hidden_image/255;
       %%��Ϊinfo_hidden_image��double�ͣ�Ҫת����0-1֮���ֵ������imshow��ʾ
       info_hidden_image=uint8(info_hidden_image);
       %figure
       imshow(info_hidden_image)  %��ʾ���˲��Ĵ�������Ϣ��ͼ��
       title('������ֵ�˲��Ĵ�������Ϣ��ͼ��');
elseif   get(handles.radiobutton21,'value')          
       %��ͨ�˲�,ʹ�ý��ƶ�ά������˹�����˲���
        info_hidden_image=double(info_hidden_image);   
        %filter_temp=[1 1 1;1 1 1 ;1 1 1]/9;
        filter_temp= fspecial('laplacian');
        info_hidden_image=filter2(filter_temp,info_hidden_image);
        info_hidden_image=uint8(info_hidden_image);
       % figure
        imshow(info_hidden_image)  %��ʾ���˲�����Ĵ�������Ϣ��ͼ��
        title('������ͨ�˲��Ĵ�������Ϣ��ͼ��');
elseif   get(handles.radiobutton22,'value') 
        %�����ͨ�˲�
  
        [f1,f2]=freqspace(size(info_hidden_image),'meshgrid');%����Ƶ�����о���
        %D=0.1;%��ֹƵ��
        %n=11120;
        Hd=ones(size(info_hidden_image));%�����ͨ�˲����Ĵ�С
        r=sqrt(f1.^2+f2.^2);%�����ͨ�˲����ľ��ߺ���
        Hd(r>0.5)=0;%�����ͨ�˲�������ֹƵ��Ϊ0.4
        %for i=size(info_hidden_image,1)
       %     for j=1:size(info_hidden_image,2)
       %         t=r(i,j)/(D*D);
       %         Hd(i,j)=1/(t^n+1);%�����˲�����
       %     end
        %end
        Y=fft2(double(info_hidden_image));%���и���Ҷ�任
        Y=fftshift(Y);%Ƶ��ƽ��
        Ya=Y.*Hd;%��ͨ�˲���
        Ya=ifftshift(Ya);%����Ҷ���任
        info_hidden_image=ifft2(Ya);
        info_hidden_image=uint8(info_hidden_image);
        %figure
        imshow(info_hidden_image)  %��ʾ���˲�����Ĵ�������Ϣ��ͼ��
        title('���������ͨ�˲����Ĵ�������Ϣ��ͼ��');
        
elseif  get(handles.radiobutton26,'value') 
            %���˲�
         info_hidden_image=double(info_hidden_image);  
         filter_temp=[0 1 0;1 -4 0;0 1 0];
         contain_marker_temp=conv2(info_hidden_image,filter_temp,'same');
         info_hidden_image=info_hidden_image-contain_marker_temp;
         info_hidden_image=uint8(info_hidden_image);
        % figure
         imshow(info_hidden_image)  %��ʾ���˲�����Ĵ�������Ϣ��ͼ��
         title('������ֵ�˲��Ĵ�������Ϣ��ͼ��');
elseif   get(handles.radiobutton33,'value') 
        %ģ���Ա���ǿ�˲�
        info_hidden_image=double(info_hidden_image);
        filter_temp= fspecial('unsharp'); 
        %filter_temp=[1 1 1;1 2 1 ;1 1 1]/10;
        info_hidden_image=filter2(filter_temp,info_hidden_image);
        info_hidden_image=uint8(info_hidden_image);
        %figure
        imshow(info_hidden_image)  %��ʾ�����������Ĵ�������Ϣ��ͼ��
        title('����ģ���Ա���ǿ�˲��Ĵ�������Ϣ��ͼ��');
elseif   get(handles.radiobutton36,'value') 
         %�����˹���
         [row,col]=size(info_hidden_image);
         r=2;
         for i=1:r:row
             for j=1:r:col
                 C(i:min(i+r-1,row),j:min(j+r-1,col))=mean2(info_hidden_image(i:min(i+r-1,row),j:min(j+r-1,col)));
             end
         end
         info_hidden_image=uint8(C);
         imshow(info_hidden_image)  %��ʾ���˲�����Ĵ�������Ϣ��ͼ��
         title('���������˹����Ĵ�������Ϣ��ͼ��');
elseif   get(handles.radiobutton37,'value') 
         %JPEGѹ������  
          imwrite(info_hidden_image,'info_hidden_image.jpg','quality',80);
          info_hidden_image=imread('info_hidden_image.jpg');
          imshow(info_hidden_image);
          title('����JPEGѹ������Ĵ�������Ϣ��ͼ��');
elseif   get(handles.radiobutton38,'value') 
         %���й���,�����м�1/16����
         [r1,c1]=size(info_hidden_image);
         info_hidden_image(r1/2-r1/8:r1/2+r1/8,c1/2-c1/8:c1/2+c1/8)=255;
         imshow(info_hidden_image) 
         title('�������еĴ�������Ϣ��ͼ��');  
elseif   get(handles.radiobutton47,'value') 
        %�����ͨ�˲�
        
        [f1,f2]=freqspace(size(info_hidden_image),'meshgrid');%����Ƶ�����о���
        %D=0.1;%��ֹƵ��
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
        title('���������ͨ�˲����Ĵ�������Ϣ��ͼ��');
end

