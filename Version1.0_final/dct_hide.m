%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%B06022120�ν����  DCT��Ϣ����
%�㷨������
%1��ͼ��DCT��Ϣ�����㷨��
%a. ������ͼ��ֳ�8��8�����ؿ飬ÿһ��ֻ�ܾ�ȷ�ر���һ��������Ϣλ��
%b. ʹ�ô���Կ������㷨����һ��������У�ÿ�����ѡ��һ�����ؿ���������Ϣ��
%c. �Ը����ؿ����DCT�任��ѡ�����е�����ϵ����Ϊ��Ϣλ�����壬��ʵ����ѡ��4��1���ͣ�3��2��������Ƶϵ����
%d. ѡ��ǰ��Ϣλ�������ϢΪΪ1��ʹ��4��1��>��3��2������֮�����ϢλΪ0��ʹ��3��2��>��4��1����

%2��ͼ��DCT��Ϣ��ȡ�㷨��
%a. ������Կ��������DCT��Ϣ����һ����������У�
%b. �����������ÿ��ѡ��һ�����ؿ飬�Ƚϣ�4��1���ͣ�3��2���Ĵ�С�������4��1��>��3��2������������ϢλΪ1����֮��������Ϣλ0��


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%key�������漴���еĹؼ���

alpha=0.04;%���ÿ�����

%cover_object0=foutain;
cover_object0=im_cover;
%cover_object0=imread(file_name);
cover_object1=double(cover_object0);
[r_cover,l_cover]=size(cover_object0);
%message=info;
message=im_message;
[r_message,l_message]=size(message);
message_vector=reshape(message,1,r_message*l_message);
message_vector=message_vector';

%�ж������Ƿ��㹻,8*9����Ϊ���һλ��żУ��λ
if r_message*l_message > r_cover*l_cover/(8*8)
    errordlg('ҪǶ����Ϣ�������޷�Ƕ�룡');
    error();
end;

s_cover=cover_object0;
s_cover=double(s_cover)/255;
%��key��ʼ���������漴����
rand('state',key_1);
randno=randperm(r_cover*l_cover/64);%���������1��r_cover*l_cover/64֮�䲻�ظ�����������

h=waitbar(0,'����ʹ��DCT�㷨Ƕ��������Ϣͼ����ȴ�');

%��ͼ�����ֿ�DCT%
T=dctmtx(8);%����8*8��DCT�任����
dctg=blkproc(s_cover,[8,8],'P1*x*P2',T,T');%�Էֿ�ͼ�����DCT�任�����ַ������ʺ��ڽ�С�����뷽����dct2()������һ�������ٶȸ���

%�����㷨
for i=1:(r_message*l_message/8)
    for j=1:8
        waitbar(((i-1)*8+j)/(length(message_vector)),h);
        %��ȡ�漴�����е�ĳһ��ֵ
        value=randno((i-1)*8+j)-1;
        %�������ֵ��ԭ�����е�����ֵ
        row=floor(value/64)*8+1;
        col=mod(value,64)*8+1;
        %ѡ��4��1���ͣ�3��2��������Ƶϵ���������ǰ��ϢλΪΪ1��ʹ��4��1��>��3��2������֮�����ϢλΪ0��ʹ��3��2��>��4��1��
        if message_vector((i-1)*8+j,1)==0
            if dctg(row+4,col+1)>dctg(row+3,col+2)
                %��������ϵ������Դ�С%
                temp=dctg(row+4,col+1);
                dctg(row+4,col+1)=dctg(row+3,col+2);
                dctg(row+3,col+2)=temp;
            end
        else
            if dctg(row+4,col+1)<dctg(row+3,col+2)
                %��������ϵ������Դ�С%
                temp=dctg(row+4,col+1);
                dctg(row+4,col+1)=dctg(row+3,col+2);
                dctg(row+3,col+2)=temp;
            end
        end
        if dctg(row+4,col+1)>dctg(row+3,col+2)
            dctg(row+3,col+2)=dctg(row+3,col+2)-alpha;
        else
            dctg(row+4,col+1)=dctg(row+4,col+1)-alpha;
        end
    end
    
end

close(h);

%��Ϣд�ر���%
s_cover=blkproc(dctg,[8 8],'P1*x*P2',T',T);
%PSNR=psnr(cover_object1,s_cover)
imwrite(s_cover,'info_hidden_image.bmp','bmp');
result=imread('info_hidden_image.bmp');

figure
subplot(121),imshow(cover_object0),title('ԭͼ��');
subplot(122),imshow(result),title('ʹ��DCT�㷨������Ϣ���ͼ��');