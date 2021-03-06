%     for j = 1:N/2
%         for i = 1:N/2-1
%             x = 1-j*h;  y = 1-i*h;
%             U_0((j-1)*(N/2-1)+i) = f(x,y);
%         end
%     end
%     for j = N/2+1:N-1
%         for i = 1:N-1
%             x = 1-j*h;  y = 1-i*h;
%             U_0((j-N/2-1)*(N-1)+i+N*(N/2-1)/2) = f(x,y);
%         end
%     end
%     re = norm(U_0-u)/norm(U_0);
% e = U_0-u;
cost = zeros(6,4);
opt.ite = 9999999999;
opt.tol = 1e-8;
err1 = zeros(6,4);
err2 = zeros(6,4);
for i = 5:9
    N = 2^i;
    [L,G] = Generate_Dif_L(N);
    u0 = Init_L(N);
    h = 2/N;
    vec_size = N*(N/2-1)/2+(N-1)*(N/2-1);
    spy(L);  
    output = V_cycle_L(u0,N,opt); 
    u = -output.u;
    tic;
    [A,d] = myLDL(L);
    u = A\u0;
    u = u./d;
    u = -A'\u;
    cost(i-4,1) = toc;
    f = @(x,y) power(x^2+y^2,1/3)*sin(2/3*mod(atan2(y,x),2*pi))*(1-x^2)*(1-y^2);
    U_0 = zeros(vec_size,1);
    subopt1.err = 1; 
    err1(i-4,1) = Int_L(N,u,subopt1);    
    opt.theta = 1;
    output = mySOR(L,u0,opt);
    cost(i-4,2) = output.cost;
    u = -output.x;
    err1(i-4,2) = Int_L(N,u,subopt1);
    opt.theta = 1.5;
    output = mySOR(L,u0,opt);
    cost(i-4,3) = output.cost;
    u = -output.x;
    err1(i-4,3) = Int_L(N,u,subopt1);
    tic;
    output = V_cycle_L(u0,N,opt);
    u = -output.u;    
    cost(i-4,4) = toc;
    err1(i-4,4) = Int_L(N,u,subopt1);
end
