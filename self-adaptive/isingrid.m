function bool = isingrid(grid,x,y)
%����(x,y)�Ƿ���������
bool = find(ismember(grid,[x,y],'rows'));
if isempty(bool);   bool = 0;   end