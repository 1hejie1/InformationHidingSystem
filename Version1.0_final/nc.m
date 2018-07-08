%计算nc(归一化相关系数)
function dNC = nc(ImageA,ImageB)

if (size(ImageA,1) ~= size(ImageB,1))|| (size(ImageA,2) ~= size(ImageB,2))
  errordlg('处理失败！');
  dNC = 0;
  return ;
end
ImageA=double(ImageA);
ImageB=double(ImageB);
M = size(ImageA,1);
N = size(ImageA,2);
d1=0 ;
d2=0;
d3=0;
for i = 1:M
  for j = 1:N
    d1=d1+ImageA(i,j)*ImageB(i,j) ;
    d2=d2+ImageA(i,j)*ImageA(i,j) ;
    d3=d3+ImageB(i,j)*ImageB(i,j) ;
  end
end
dNC=d1/(sqrt(d2)*sqrt(d3));
%return
%判断dNC的值是整形还是浮点型，并根据类型做相应的字符转换
%if dNC==1
  %  dNC_str_1=int2str(dNC);
%else 
dNC_str_1=num2str(dNC,'%.5f');
%end
dNC_str=['NC=' dNC_str_1];
msgbox(dNC_str)