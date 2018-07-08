if  isempty(get(handles.edit14,'string'))
    key_2=[];
    errordlg('请输入提取信息的密钥，并确定','错误')
    error();
end
 if isempty(key_2)
    errordlg('请按"确定"键，确定密钥的输入','错误')
    error();
 end
 if  isempty(im_message)
  errordlg('无法获取秘密图片的规格，无法提取出的秘密信息图像','错误')
  error();
 end
