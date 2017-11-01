
x = linspace(0,1,1000);
Pos = [1 2 3 5 7 8]/10;
Hgt = [4 4 4 2 2 3];
Wdt = [2 6 3 3 4 6]/100;

for n = 1:length(Pos)
    Gauss(n,:) =  Hgt(n)*exp(-((x - Pos(n))/Wdt(n)).^2);
end

PeakSig = sum(Gauss);
plot(x,Gauss,'--',x,PeakSig)
[pks,locs] = findpeaks(PeakSig,x);
findpeaks(PeakSig,x)

text(locs+.02,pks,num2str((1:numel(pks))'))
[psor,lsor] = findpeaks(PeakSig,x,'SortStr','descend');

findpeaks(PeakSig,x)

text(lsor+.02,psor,num2str((1:numel(psor))'))