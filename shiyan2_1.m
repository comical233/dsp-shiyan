clc
clear

x1=[0,1,2,4];
x2=[1,0,1,0,1];
N1 = size(x1,2);
N2 = size(x2,2);
N = max(N1,N2);
if N1>N2
    x2 = [x2,zeros(1,N1-N2)];
elseif N2>N1
    x1 = [x1,zeros(1,N2-N1)];
end
y = 2*x1+3*x2;
n = 0:N-1;
k = 0:N-1;
yk1 = y*(exp(-1i*2*pi/N)).^(n'*k)
xk1 = x1*(exp(-1i*2*pi/N)).^(n'*k)
xk2 = x2*(exp(-1i*2*pi/N)).^(n'*k)
yk2 = 2*xk1+3*xk2
subplot(1,2,1)
stem(yk1)
subplot(1,2,2)
stem(yk2)


