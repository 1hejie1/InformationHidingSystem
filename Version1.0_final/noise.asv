myaxes
%h=handles.axre
axes(findobj(gcf,'Tag','axes1')); %调用坐标1显示加噪声图像
info_hidden_image=imread('info_hidden_image.bmp');
if get(handles.radiobutton31,'value')  %选择无噪声时，不做任何处理
    %figure
    imshow(info_hidden_image)  %显示受噪声攻击的带秘密信息的图像
    title('无噪声攻击的带秘密信息的图像');
    %no_noise_image=imnoise(uint8(contain_marker),'gaussian',0,get(handles.slider6,'value')); 
elseif get(handles.radiobutton14,'value') %选择高斯噪声时，进行高斯噪声处理
   info_hidden_image=imnoise(uint8(info_hidden_image),'gaussian',0.1,get(handles.slider6,'value')); 
   %figure
   imshow(info_hidden_image)  %显示受噪声攻击的带秘密信息的图像
   title('加高斯噪声攻击的带秘密信息的图像');
elseif get(handles.radiobutton15,'value') %选择椒盐噪声时，进行椒盐噪声处理
   info_hidden_image=imnoise(uint8(info_hidden_image),'salt & pepper',get(handles.slider7,'value'));
   %figure
   imshow(info_hidden_image)  %显示受噪声攻击的带秘密信息的图像
   title('加椒盐噪声攻击的带秘密信息的图像');
elseif get(handles.radiobutton16,'value') %选择均值噪声时，进行均值噪声处理
    [r_info_hidden_image,l_info_hidden_image]=size(info_hidden_image);
    info_hidden_image=imnoise(uint8(info_hidden_image),'localvar',ones(r_info_hidden_image,l_info_hidden_image)*get(handles.slider8,'value')); 
   % figure
    imshow(info_hidden_image)  %显示受噪声攻击的带秘密信息的图像
    title('加均值噪声攻击的带秘密信息的图像');
elseif get(handles.radiobutton17,'value') %选择泊松噪声时，进行泊松噪声处理
   info_hidden_image=imnoise(uint8(info_hidden_image),'poisson'); 
   %figure
    imshow(info_hidden_image)  %显示受噪声攻击的带秘密信息的图像
    title('加泊松噪声攻击的带秘密信息的图像');
elseif get(handles.radiobutton18,'value') %选择乘性噪声时，进行乘性噪声处理
    info_hidden_image=imnoise(uint8(info_hidden_image),'speckle',get(handles.slider10,'value'));
    %figure
    imshow(info_hidden_image)  %显示受噪声攻击的带秘密信息的图像
    title('加乘性噪声攻击的带秘密信息的图像');
elseif get(handles.radiobutton39,'value') %选择乘性噪声时，进行乘性噪声处理
    info_hidden_image=info_hidden_image+get(handles.slider11,'value');
    %figure
    imshow(info_hidden_image)  %显示受噪声攻击的带秘密信息的图像
    title('亮度变换后的带秘密信息的图像');   
end
