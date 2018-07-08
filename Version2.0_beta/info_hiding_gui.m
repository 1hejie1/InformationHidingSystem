function varargout = info_hiding_gui(varargin)
% INFO_HIDING_GUI M-file for info_hiding_gui.fig
%      INFO_HIDING_GUI, by itself, creates a new INFO_HIDING_GUI or raises the existing
%      singleton*.
%
%      H = INFO_HIDING_GUI returns the handle to a new INFO_HIDING_GUI or the handle to
%      the existing singleton*.
%
%      INFO_HIDING_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INFO_HIDING_GUI.M with the given input arguments.
%
%      INFO_HIDING_GUI('Property','Value',...) creates a new INFO_HIDING_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before info_hiding_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to info_hiding_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help info_hiding_gui

% Last Modified by GUIDE v2.5 17-Jun-2010 00:38:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @info_hiding_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @info_hiding_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before info_hiding_gui is made visible.
function info_hiding_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to info_hiding_gui (see VARARGIN)
clc;
global flag
flag=-1;
V=get(0,'screensize') ;%��ȡ��ǰ����Ļ�Ĵ�С��Ϣ
a=V(3)/2-510;
b=V(4)/2-335;
set(gcf,'Position',[a b 1021 671])
%clear;
% Choose default command line output for info_hiding_gui
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
set(handles.radiobutton31,'value',1);%��������������Ĭ��ֵΪ����������
set(handles.radiobutton32,'value',1);%�����˲������Ĭ��ֵΪ�����˲���
set(handles.slider6,'value',0);%���û�������Ĭ��ֵΪ0
set(handles.slider7,'value',0);
set(handles.slider8,'value',0);
%set(handles.slider9,'value',0);
set(handles.slider10,'value',0);
set(handles.edit8,'string',0);
set(handles.edit9,'string',0);
set(handles.edit10,'string',0);
%set(handles.edit11,'string',0);
set(handles.edit12,'string',0);
set(handles.edit15,'string',0);
%key_1=[];%��ʼ����ԿΪ��
%key_2=[];
%set(handles.edit1,'string','');
%set(handles.edit2,'string','');

% UIWAIT makes info_hiding_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = info_hiding_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
response=questdlg('ȷ��Ҫ�رմ˳���?','��ʾ�Ի���','�ر�','ȡ��',1);
if strcmp('�ر�',response)
    close(gcf)
end

% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%msgbox('name','��Ȩ����','string','Copyright ? 2010-2100 �ν� �Ͼ��ʵ��ѧ' )
V=get(0,'screensize') ;%��ȡ��ǰ����Ļ�Ĵ�С��Ϣ
a=V(3)/2-234+3;
b=V(4)/2-132+70;
copyright('Position',[a b 468 264])%���õ�����copyright��������Ļ���м丽��λ��
                                   

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
V=get(0,'screensize') ;%��ȡ��ǰ����Ļ�Ĵ�С��Ϣ
a=V(3)/2-151;
b=V(4)/2-200+70;
thanks('Position',[a b 303 403])

% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
gaussian_slide=get(handles.slider6,'value');
%disp(gaussian_slide)  %����
set(handles.edit8,'string',gaussian_slide);

% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
salt_slide=get(handles.slider7,'value');
%disp(gaussian_slide)  %����
set(handles.edit9,'string',salt_slide);

% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider8_Callback(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
localvar_slide=get(handles.slider8,'value');
%disp(gaussian_slide)  %����
set(handles.edit10,'string',localvar_slide);

% --- Executes during object creation, after setting all properties.
function slider8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
poisson_slide=get(handles.slider9,'value');
%disp(gaussian_slide)  %����
set(handles.edit11,'string',poisson_slide);

% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
gaussian_edit=get(handles.edit8,'string');
%disp(gaussian_slide)  %����
gaussian_edit=str2num(gaussian_edit);
if gaussian_edit>0.1||gaussian_edit<0
    errordlg('������������䣡')
    error();
end
set(handles.slider6,'value',gaussian_edit);

% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider10_Callback(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
speckle_slide=get(handles.slider10,'value');
%disp(gaussian_slide)  %����
set(handles.edit12,'string',speckle_slide);

% --- Executes during object creation, after setting all properties.
function slider10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
salt_edit=get(handles.edit9,'string');
%disp(gaussian_slide)  %����
salt_edit=str2num(salt_edit);
if salt_edit>0.1||salt_edit<0
    errordlg('������������䣡')
    error();
end
set(handles.slider7,'value',salt_edit);


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double
localvar_edit=get(handles.edit10,'string');
%disp(gaussian_slide)  %����
localvar_edit=str2num(localvar_edit);
if localvar_edit>0.1||localvar_edit<0
    errordlg('������������䣡')
    error();
end
set(handles.slider8,'value',localvar_edit);



% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double

poisson_edit=get(handles.edit11,'string');
%disp(gaussian_slide)  %����
poisson_edit=str2num(poisson_edit);
if poisson_edit>0.1||poisson_edit<0
    errordlg('������������䣡')
    error();
end
set(handles.slider9,'value',poisson_edit);

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double
speckle_edit=get(handles.edit12,'string');
%disp(gaussian_slide)  %����
speckle_edit=str2num(speckle_edit);
if speckle_edit>0.1||speckle_edit<0
    errordlg('������������䣡')
    error();
end
set(handles.slider10,'value',speckle_edit);


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_cover 
global im_message
global key_2
global flag
get_var_error_expression %�ж��Ƿ�������Կ

disp('LSB��ȡ')%����
noise
myfilter
lsb_get

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%��������ͼ��������Ϣͼ�����Կ��ȫ�ֱ���
global im_cover 
global im_message
global key_2

get_var_error_expression %�ж��Ƿ�������Կ

disp('DCT��ȡ') %����
noise
myfilter
dct_get

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_cover 
global im_message
global key_2
get_var_error_expression %�ж��Ƿ�������Կ

disp('DWT��ȡ') %����
noise
myfilter
dwt_get

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im_cover  %����imΪȫ�ֱ���

%ѡ������ͼƬ
[filename,pathname]=...
    uigetfile({'*.bmp'},'ѡ��ͼƬ');

%�ϳ�·��+�ļ���
str=[pathname filename];

%��ȡͼƬ
im_cover=imread(str);
%�ж��Ƿ�Ϊ�Ҷ�ͼ��
%if ndims(im_cover)~=2
if ~isgray(im_cover)
    errordlg('��ѡ��Ҷ�ͼ����Ϊ����ͼ��');
    error();
end
im_cover=uint8(im_cover);
set(handles.edit1,'string',str);



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im_message  %ȫ�ֱ���
global flag
flag=0;
%ѡ������ͼƬ
[filename1,pathname1]=...
    uigetfile({'*.bmp'},'ѡ��ͼƬ');

%�ϳ�·��+�ļ���
str=[pathname1 filename1];

%��ȡͼƬ
im_message=imread(str);
%�ж��Ƿ�Ϊ��ά��ֵͼ��
%test_message=find(im_message~=0&im_message~=1);
%if isempty(test_message)
%    test_value=0;
%else
%    test_value=1;
%end
%if ndims(im_message)~=2||test_value
%if any(im_message~=0|im_message~=1)
if ~isbw(im_message)
    errordlg('��ѡ���ֵͼ����Ϊ������Ϣͼ��');
    error();
end

set(handles.edit2,'string',str);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_cover
global im_message  %ʹȫ������ͼ��ı���
global flag

%�ж��Ƿ��Ѿ�ѡ������ͼ���������Ϣͼ��
if  isempty(im_cover)
    errordlg('��ѡ��һ��ͼƬ��Ϊ����ͼƬ','����');
    error();
end
if flag==1
    figure
    imshow(im_cover);title('����ͼ��');
elseif flag==0
    if  isempty(im_message)
    errordlg('��ѡ��һ��ͼƬ��Ϊ����ͼƬ','����');
    error();
    end

%if im_message==NULL
%    errordlg('��ѡ������ͼ��');
%    error();
%end
figure
subplot(121);
imshow(im_cover);title('����ͼ��');
subplot(122);
imshow(im_message);title('������Ϣͼ��');
end

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_cover
global flag
if flag==-1
    errordlg('����ִ��Ƕ�������');
    error();
end
if  isempty(im_cover)
  errordlg('����ִ��Ƕ�������');
  error();
end
info_hidden_image_psnr=imread('info_hidden_image.bmp');

PSNR=psnr(im_cover,info_hidden_image_psnr);
%PSNR= vpa(PSNR,6);
PSNR_str_1=num2str(PSNR,'%1.4f');
PSNR_str=['PSNR=' PSNR_str_1 'dB'];
msgbox(PSNR_str,'��ֵ�����')
%msgbox(num2srt(PSNR))
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_cover
global flag
if flag==-1
    errordlg('����ִ��Ƕ�������');
    error();
end
if  isempty(im_cover)
  errordlg('����ִ��Ƕ�������');
  error();
end
hide_compare

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_message
global flag
if flag==1
    errordlg('������Ϣ��Ϊͼ���޷������һ����أ�');
    error();
end
if exist('info_recover_image.bmp','file')==0
    errordlg('����ʧ��,������ȡ������Ϣ!');
    error();
end
message_recover=imread('info_recover_image.bmp');
nc(im_message,message_recover)


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��ԭʼ��������Ϣ�ͻָ����������Ϣ����ֵ����
global im_message

if  isempty(im_message)
  errordlg('����ʧ�ܣ�')
  error();
end
%message_recover_comp=imread('info_recover_image.bmp');
recover_compare



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global key_1
key_1=get(handles.edit13,'string');
%disp(key_1)  %����
key_1=str2double(key_1);

function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global key_2
key_2=get(handles.edit14,'string');
%disp(key_1)
key_2=str2double(key_2);

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%��������ͼ��������Ϣͼ�����Կ��ȫ�ֱ���
global im_cover 
global im_message
global key_1

%str=get(handles.radiobutton27,'string');
hide_var_error_expression %�ж�ȫ�ֱ����Ƿ����


 %����valuede����ֵ���������Ӧ���㷨������Ϣ����
 if (get(handles.radiobutton27,'value'))
     disp('LSB�㷨') %����
      lsb_hide
 elseif (get(handles.radiobutton28,'value'))
     disp('DCT�㷨') %����
     dct_hide
 elseif (get(handles.radiobutton29,'value'))
      disp('DWT�㷨') %����
      dwt_hide
    %case 'DWT�㷨'
 else
     disp('LHA�㷨')
     lha_hide
end


% --- Executes on button press in radiobutton27.
function radiobutton27_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton27
handles.sel=1;
guidata(hObject, handles);

% --- Executes on button press in radiobutton28.
function radiobutton28_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton28


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over slider6.
function slider6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_cover 
global im_message
global key_2

get_var_error_expression %�ж��Ƿ�������Կ

disp('LHA��ȡ')%����
noise
myfilter
lha_get


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_cover
global flag
if flag==-1
    errordlg('����ִ��Ƕ�������');
    error();
end
if  isempty(im_cover)
  errordlg('����ִ��Ƕ�������');
  error();
end
myMSE

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_message

if exist('info_recover_image.bmp','file')==0
    errordlg('����ʧ��,������ȡ������Ϣ!');
    error();
end
message_recover=imread('info_recover_image.bmp');
myBER




% --- Executes during object creation, after setting all properties.
function slider11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double
light_edit=get(handles.edit15,'string');
%disp(gaussian_slide)  %����
light_edit=str2num(light_edit);
if light_edit>255||light_edit<-255
    errordlg('�������������[-255 255]֮���ֵ��')
    error();
end
set(handles.slider11,'value',light_edit);

% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider11_Callback(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
light_slide=get(handles.slider11,'value');
%disp(gaussian_slide)  %����
set(handles.edit15,'string',light_slide);


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag
flag=1;
global im_message
global answer
set(handles.edit2,'string','');
prompt={'��������������Ϣ'};
defaultanswer={''};
name='������Ϣ����';
numlines=1;
options.Resize='on';
answer=inputdlg(prompt,name,numlines,defaultanswer,options);
if isempty(answer{1,1})
    errordlg('����������Ϣ����Ϊ��!�����䣡');
    error();
end
b=unicode2native(answer{1,1});
[m,n]=size(b);
for i=1:n
c(i,1:8)=bitget(uint8(b(i)),1:8);
end
im_message=logical(c);


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im_message
global flag
global answer

if isempty(answer)||isempty(answer{1,1})
    errordlg('������������������Ϣ!');
    error();
end
if flag==1
    messagestr={'����������Ϣ�ǣ�';''; answer{1,1}};
    msgbox(messagestr,'Ƕ���������Ϣ');
elseif flag==0
    errordlg('����ʧ�ܣ�Ƕ����Ϣ�������֣�');
    error();
end
   


% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
helpstr={'����������벦110';' ';' ';'�Ǻǣ�����ı��֮�࿪��С��Ц��';'���ǧ����棡';
    '����ʱ��Ĺ�ϵ�������ĵ����ûʱ��д�ˣ�';'�����ڴ�����Ҽ��£�'};
helpdlg(helpstr);
