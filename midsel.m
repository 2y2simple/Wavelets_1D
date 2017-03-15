function [ y ] = midsel( x,N )
% midsel : 选择x中间N个值
% x ------ 原始信号
% N ------ y序列个数


Lx = length(x);                     % x序列长度
st = floor((Lx-N)/2);               % y序列起始位置
for i = 1:N
    y(i) = x(st+i);
end


end

