if  isempty(im_cover)||isempty(get(handles.edit1,'string'))
    errordlg('请选择一张图片作为载体图片','错误')
    error();
end
if  isempty(im_message)
    errordlg('请选择一张图片或文字作为秘密信息','错误')
    error();
end
if  isempty(get(handles.edit13,'string'))
    key_1=[];
    errordlg('请输入隐藏信息的密钥，并确定','错误')
    error();
end
if  isempty(key_1)
    errordlg('请按"确定"键，确定密钥的输入','错误')
    error();
end

