wp1 = 0.3*pi;
wp2 = 0.7*pi;
ws1 = 0.1*pi;
ws2 = 0.9*pi;
rp = 1;
as = 15;

fs = 2000;
t = 1/fs;
omgp1 = wp1*fs; omgp2 = wp2*fs; omgp = [omgp1,omgp2];
omgs1 = ws1*fs; omgs2 = ws2*fs; omgs = [omgs1,omgs2];

bw = omgp2-omgp1; wo = sqrt(omgp1*omgp2);
[n,omgn] = cheb1ord(omgp,omgs,rp,as,'s');
[z0,p0,k0] = cheb1ap(n,rp);
[ba1,aa1] = zp2tf(z0,p0,k0);

[ba,aa] = lp2bp(ba1,aa1,wo,bw);
[bd,ad] = impinvar(ba,aa,fs);

freqz(bd,ad);



