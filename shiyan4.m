fp1 = 150; fp2 = 350; fs1 = 100; fs2 = 400; fs=1000;
ws1 = fs1/ (fs/2)*pi; ws2 = fs2/(fs/2)*pi;
wp1 = fp1/ (fs/2)*pi; wp2 = fp2/ (fs/2)*pi;
%计算归一化角频率deltaw-wp1-ws1 
deltaw = wp1-ws1;%计算过度带宽度
N0 = ceil(11*pi/deltaw); %按布某克吴亩计算滤被器长度
N = N0+mod (N0+1, 2); %为实现FIR类型1偶对称滤波器,应确保N为奇数
windows=blackman (N);
wc1 = (ws1+wp1)/2/pi; wc2 = (ws2+wp2) /2/pi;
b=fir1 (N-1, [wc1, wc2], windows) ;
[H, w] = freqz (b, 1, 1000) ; %求解频率特性
n=0:N-1;
subplot (2, 2, 1) ; stem(n, b) ; 
axis ([0, N, 1.1*min(b), 1.1*max(b)])
subplot (2, 2, 2); stem (n, windows)
db=20*log10((abs (H) + eps) /max (abs (H))); %化为分贝值
subplot (2, 2,3); plot(w/pi, db); %ax1s (C0, 1,-150, 50]) 
subplot (2, 2,4); plot (w/pi, angle (H)); %axis([0, 1,-4,4]) 
figure; 
freqz (b, 1, 1000)
