function unit = repair(unit0)
%������ĵ�Ԫ�񶥵�����Ϊ���ϡ����¡����¡�����,�����һ��4*2����
[x,k] = sort(unit0(:,1),'descend');
y=zeros(4,1);
for i = 1:4
    y(i) = unit0(k(i),2);
end
if y(1) < y(2)
    c = y(1);
    y(1) = y(2);
    y(2) = c;
end
if y(3) > y(4)
    c = y(3);
    y(3) = y(4);
    y(4) = c;
end
unit = [x,y];
