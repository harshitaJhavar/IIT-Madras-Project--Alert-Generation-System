period=1:1:31;

%interval=[interval,31];
subplotno=1;
array=[2,3,5,6,10,30];
error=zeros(1,numel(array));
for idx=1:numel(array)
    i=array(idx);
    interval=period([1:i:31])
    if i>=7& i~=10 &i~=15 &i~=30
        interval=[interval,31]
    end
age=[157;158;170;171;172;173;181;170;171;265;267;269;242;202;204;205;206;207;208;209;210;229;230;231;232;233;234;235;236;237;239];
y=interp1(period(interval),age(interval),1:0.001:31);
string=stringGen(period(interval),age(interval))
missing_entries=period;%directly calculate for all values;
agebyInterpolation=interp1(period(interval),age(interval),missing_entries);
error(idx)=sqrt(sum((age'-agebyInterpolation).^2)/numel(age));
subplot(3,2,subplotno)
%figure

%vertical line
 
plot(period(interval),age(interval),'o',1:0.001:31,y,'b',period,age,'*');
%xlabel(string);
y1=get(gca,'ylim');
hold on
[r c]=size(interval);
for k=1:c
interval(k); 
plot([interval(k) interval(k)],y1,':.')
 hold on
end
xlabel(sprintf('%d interval \n string %s',i,string ));


subplotno=subplotno+1;
end
figure
plot(1:numel(array),error)
ax=gca;
set(ax,'XTick',[2 3 5 6 10 30]);
title('error')
xlabel('interval')
ylabel('error')
