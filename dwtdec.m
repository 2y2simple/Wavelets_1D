function [ c,l ] = dwtdec( x,N,h,g)
% dwtdec : 离散小波分解
% x ------ 原始信号
% N ------ 分解层数
% h ------ 低通滤波器系数
% g ------ 高通滤波器系数
% c ------ 小波系数，按照近似系数、细节系数顺序存放
% l ------ 小波系数长度，与c顺序一致


c = [];                                 % 分解系数初始化
l = length(x);                          % 系数个数初始化，长度为原始数据长度
cA = x;                                 % 第一层分解，取原始数据为近似系数

for i = 1:N
    a = symconv(cA,h);                  % 近似系数
    a = downsel(a);                     % 下抽样,仅保存偶数部分
    b = symconv(cA,g);                  % 细节系数
    b = downsel(b);                     % 下抽样，仅保存偶数部分
    cA = a;                             % 选取近似系数作为下一次分解
    c = [b,c];                          % 小波分解系数
    m = length(b);
    l = [m,l];                          % 分解系数长度
end
c = [cA,c];
n = length(cA);
l = [n,l];


end

