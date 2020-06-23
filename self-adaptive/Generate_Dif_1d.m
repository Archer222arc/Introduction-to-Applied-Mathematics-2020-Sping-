function Dif = Generate_Lap_1d(matrix_size,h)
%����һά�Ĳ�־���
if nargin < 2;             h = 1;                     end
n = matrix_size;
Dif = spdiags(-2*ones(n,1),0,n,n)+...
      spdiags(ones(n,1),-1,n,n)+...
      spdiags(ones(n,1),1,n,n);
Dif = Dif/h^2;