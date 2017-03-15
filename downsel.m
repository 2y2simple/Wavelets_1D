function [ y ] = downsel( x )
% downsel : 下抽样函数，隔点采样
% x  ------ 原始信号
% y  ------ 下抽样后的信号

Lx = length(x);                 % x的长度
N = floor(Lx/2);                % floor函数为向下取整
for i = 1:N
    y(i) = x(2*i);              % 偶采样,隔点采样
end

end

