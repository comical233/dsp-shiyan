clc
clear
kk = 1;
for N = 100:100:2000
y = 10*sin(2*pi*30*N);
n = [0:N-1];
k=n;
t0 = clock;
xk = y*exp(1i*2*pi/N).^(n'*k);
dft_time(kk) = etime(clock,t0)
t0 = clock;
yf = fft(y,N);
fft_time(kk) = etime(clock,t0)
kk = kk+1;

end
plot(100:100:2000,fft_time)
hold on
plot(100:100:2000,dft_time)
axis([-inf inf -0.2 inf])
grid on
kk = 1;
fft_time = [];
for L = 2000:100:4000

T = 0:L-1;
x1 = 0.5*T;
x2 = 2*T;
t0 = clock;
yc = conv(x1,x2);
conv_time(kk) = etime(clock,t0)
t0 = clock;
yf = ifft(fft(x1,L).*fft(x2,L));
fft_time(kk) = etime(clock,t0)
kk = kk+1;
end

plot( 2000:100:4000,fft_time)
hold on
plot( 2000:100:4000,conv_time)
axis([-inf inf -inf inf])
grid on
