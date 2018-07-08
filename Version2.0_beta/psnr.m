%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%B06022120何杰  psnr
%%计算峰值信噪比
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function dPSNR = psnr(ImageA1,ImageB1)
ImageA=double(ImageA1);
ImageB=double(ImageB1);
if (size(ImageA,1) ~= size(ImageB,1)) or (size(ImageA,2) ~= size(ImageB,2))
    errordlg('处理失败！');
    error();
    dPSNR = 0;
    return ;
end
M = size(ImageA,1);
N = size(ImageA,2);
    d = 0 ;
for i = 1:M
    for j = 1:N
        d = d + (ImageA(i,j) - ImageB(i,j)).^2 ;
    end
end
dPSNR = -10*log10(d/(255*255*M*N)) ;
return
