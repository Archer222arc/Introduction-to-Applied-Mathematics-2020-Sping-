function u = toreal(i,j,N)
%��(1-h,1-h)ת��Ϊ(1,1)
h = 2/N;
x = 1-j*h;
y = 1-i*h;
u = [x,y];