function bool = isinregion(x,y)
%�ж��Ƿ���L��������
if nargin < 2
    c = x; x = c(1); y = c(2);
end
if abs(x) > 1 || abs(y) > 1;    bool = 0;
elseif x >= 0 && y <= 0;  bool = 0;
else bool = 1;
end