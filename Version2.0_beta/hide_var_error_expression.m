if  isempty(im_cover)||isempty(get(handles.edit1,'string'))
    errordlg('��ѡ��һ��ͼƬ��Ϊ����ͼƬ','����')
    error();
end
if  isempty(im_message)
    errordlg('��ѡ��һ��ͼƬ��������Ϊ������Ϣ','����')
    error();
end
if  isempty(get(handles.edit13,'string'))
    key_1=[];
    errordlg('������������Ϣ����Կ����ȷ��','����')
    error();
end
if  isempty(key_1)
    errordlg('�밴"ȷ��"����ȷ����Կ������','����')
    error();
end

