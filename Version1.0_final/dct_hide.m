%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%B06022120何杰设计  DCT信息隐藏
%算法描述：
%1、图像DCT信息隐藏算法：
%a. 将载体图像分成8×8的象素块，每一块只能精确地编码一个秘密信息位；
%b. 使用带密钥的随机算法产生一个随机序列，每次随机选择一个象素块来隐藏信息；
%c. 对该象素块进行DCT变换，选择其中的两个系数作为信息位的载体，本实验中选择（4，1）和（3，2）两个中频系数；
%d. 选择当前信息位，如果信息为为1，使（4，1）>（3，2），反之如果信息位为0，使（3，2）>（4，1）；

%2、图像DCT信息提取算法：
%a. 输入密钥，产生与DCT信息隐藏一样的随机序列；
%b. 根据随机序列每次选择一个象素块，比较（4，1）和（3，2）的大小，如果（4，1）>（3，2），得隐藏信息位为1，反之得隐藏信息位0；


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%key是生成随即序列的关键字

alpha=0.04;%设置控制量

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

%判断载体是否足够,8*9是因为多出一位奇偶校验位
if r_message*l_message > r_cover*l_cover/(8*8)
    errordlg('要嵌入信息量过大，无法嵌入！');
    error();
end;

s_cover=cover_object0;
s_cover=double(s_cover)/255;
%用key初始化并生成随即序列
rand('state',key_1);
randno=randperm(r_cover*l_cover/64);%产生随机的1到r_cover*l_cover/64之间不重复的整数矩阵

h=waitbar(0,'正在使用DCT算法嵌入秘密信息图像，请等待');

%对图像做分块DCT%
T=dctmtx(8);%产生8*8的DCT变换矩阵
dctg=blkproc(s_cover,[8,8],'P1*x*P2',T,T');%对分块图像进行DCT变换，这种方法较适合于较小的输入方阵，与dct2()计算结果一样，但速度更快

%隐藏算法
for i=1:(r_message*l_message/8)
    for j=1:8
        waitbar(((i-1)*8+j)/(length(message_vector)),h);
        %获取随即序列中的某一个值
        value=randno((i-1)*8+j)-1;
        %计算出该值在原矩阵中的行列值
        row=floor(value/64)*8+1;
        col=mod(value,64)*8+1;
        %选择（4，1）和（3，2）两个中频系数；如果当前信息位为为1，使（4，1）>（3，2），反之如果信息位为0，使（3，2）>（4，1）
        if message_vector((i-1)*8+j,1)==0
            if dctg(row+4,col+1)>dctg(row+3,col+2)
                %调整两个系数的相对大小%
                temp=dctg(row+4,col+1);
                dctg(row+4,col+1)=dctg(row+3,col+2);
                dctg(row+3,col+2)=temp;
            end
        else
            if dctg(row+4,col+1)<dctg(row+3,col+2)
                %调整两个系数的相对大小%
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

%信息写回保存%
s_cover=blkproc(dctg,[8 8],'P1*x*P2',T',T);
%PSNR=psnr(cover_object1,s_cover)
imwrite(s_cover,'info_hidden_image.bmp','bmp');
result=imread('info_hidden_image.bmp');

figure
subplot(121),imshow(cover_object0),title('原图像');
subplot(122),imshow(result),title('使用DCT算法隐藏信息后的图像');