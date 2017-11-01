period=[1:1:31];
age=[157;158;170;171;172;173;181;170;171;265;267;269;242;202;204;205;206;207;208;209;210;229;230;231;232;233;234;235;236;237;239];
subplot(3,1,1)
plot(age');

yy1 = smooth(period,age,0.4,'loess');
yy2 = smooth(period,age,0.2,'rloess');
subplot(3,2,2)
plot(yy1)
subplot(3,3,3)
plot(yy2)
[Maxima,MaxIdx] = findpeaks(Data);
DataInv = 1.01*max(Data) - Data;
[Minima,MinIdx] = findpeaks(DataInv);
Minima = Data(MinIdx);