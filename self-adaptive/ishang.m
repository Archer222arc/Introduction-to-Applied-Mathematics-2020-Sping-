function output = ishang(grid,unit_grid,x,y)
%����Ƿ�����,type ���ͣ�bool Ϊ�Ƿ����㣬 dΪ��̾��룬 nΪ�ھ�(������)����Ϊ��������
%type 1 Ϊ 4��ϸ��Ԫ�Ĺ�������
%type 2 Ϊ ���� ��ʱ���������
%type 3 Ϊ ������ϸ���룬�����־���,���ص�dis��2����Ԫ��,disΪϸ����λ��
%���еı߽�㶼��type 3
if nargin < 3;   c = x;x=c(1);y=c(2);end
dir = [1,0;0,-1;-1,0;0,1];
[d_min,n] = mydistance(grid,x,y);
output.n = n;
d = min(d_min);
u = [x,y];

flag = 1;
for i = 1:4
    v = u;
    for j = i:i+3
        k = mod(j,4); if k==0;k=4;end
        v = v+d*dir(k,:);
        if isempty(find(ismember(grid,v,'rows'))) && ~isedge(v); flag = 0; break; end
    end
    if flag == 0;   break; end
end
if flag == 1
    output.type = 1;
    output.dis = d;
%     output.dir = dir;
    return;
end
%�����ж��Ƿ�Ϊ����
if length(find(d_min==d)) ~= 3
    output.type = 3;
    output.dis = d;
    return;
end
m = find(d_min==max(d_min));
v = u; unit =[];
for i = m:-1:m-3
    j = mod(i,4);if j==0;j = 4;end
    unit = [unit;v];
    v = v+2*d*dir(j,:);
end
unit = repair(unit);
flag = 0;
for i = 1:length(unit_grid)
    if isequal(unit,unit_grid{i})
        flag = 1; break; 
    end
end
if flag == 0
    output.type = 2;
    output.dis = d;
else
    output.type = 3;
    output.dis = d;
end
