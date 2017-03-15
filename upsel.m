function [ y ] = upsel( x )
% upsel : 上抽样，补零
% x ------ 原始信号
% y ------ 上抽样后的信号


Lx = length(x);                     % x的长度
for i = 1:Lx
    y(2*i-1) = 0;                   % 补零
    y(2*i) = x(i);
end
y(2*Lx+1) = 0;


end

