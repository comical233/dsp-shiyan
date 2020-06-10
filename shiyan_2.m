b=[0.1321,0.3963,0.3963,0.1321];
a=[1,-0.34319,0.60439,-0.20407];
t = -2:10;
x = square(t/5);

h=impz(b,a,N);  %直接型单位脉冲响应
%x=[ones(1,5),zeros(1,N-5)]; %单位阶跃信号
y=filter(b,a,x);    %直接型输出信号
subplot(1,2,1);stem(h);title('直接型h(n)');
subplot(1,2,2);stem(y);title('直接型y(n)');