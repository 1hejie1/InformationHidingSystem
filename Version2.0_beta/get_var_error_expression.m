if  isempty(get(handles.edit14,'string'))
    key_2=[];
    errordlg('��������ȡ��Ϣ����Կ����ȷ��','����')
    error();
end
 if isempty(key_2)
    errordlg('�밴"ȷ��"����ȷ����Կ������','����')
    error();
 end
 if  isempty(im_message)
  errordlg('�޷���ȡ����ͼƬ�Ĺ���޷���ȡ����������Ϣͼ��','����')
  error();
 end
