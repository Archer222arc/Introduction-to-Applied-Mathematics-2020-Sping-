function u = togrid(x,y,N)
%������ת��Ϊ������ʽ��(1-h,1-h) -> (1,1)
h = 2/N;
j = floor((1-x)/h);
i = floor((1-y)/h);
u  =[i,j];