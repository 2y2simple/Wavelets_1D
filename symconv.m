function [ y ] = symconv( x,h)
% symconv : 首尾对称卷积运算，Symmetric-padding
% x ------ 输入序列
% h ------ 待卷积因子，滤波器系数
% y ------ 首尾对称卷积结果


Lx = length(x);                     % x的数据长度
Lh = length(h);                     % h的数据长度

% ------ 第一步：首尾对称延拓 ------%
% 首位置延拓
for i = 1:Lh
    xe(i) = x(Lh-i+1);
end
% x赋值
for i = 1:Lx
    xe(Lh+i) = x(i);
end
% 尾位置赋值
for i = 1:Lh
    xe(Lh+Lx+i) = x(Lx-i+1);
end

% ------ 第二步：卷积 ------ %
% xe首尾零填充，填充长度为Lh-1
Lxe = Lx+2*Lh;                  % xe数据长度
for i = 1:Lh-1
    xz(i) = 0;                  % 首位置补零
end
for i = 1:Lxe
    xz(Lh-1+i) = xe(i);         % 中间数据xe赋值
end
for i = 1:Lh-1
    xz(Lh+Lxe-1+i) = 0;         % 尾位置补零
end
% 计算卷积conv(xz,h)
for i = 1:(Lx+2*Lh)+Lh-1
    ys(i) = 0;                  % ys起始值为零
    for j = 1:Lh
        ys(i) = ys(i)+xz(i+j-1)*h(Lh-j+1);          % 卷积表达式
    end
end

% ------ 第三步：卷积结果截断 ------　％
for i = 1:Lx+Lh-1
    y(i) = ys(Lh+i);            % 首尾截断Lh长度
end

end

