function Dif = Generate_Dif_2d(matrix_size,h)
%���ɶ�ά�Ĳ�־���
%matrix_sizeΪ����
m = matrix_size(1);
n = matrix_size(2);
Dif = kron(Generate_Dif_1d(n),speye(m))+kron(speye(n),Generate_Dif_1d(m));
Dif = Dif/h^2;