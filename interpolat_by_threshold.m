period=1:1:31;
i=2;
loop=1;
errorList=[];
error=0;
threshold=1*35.7339;
%% since greedy is not optimal have to do someting extra
%% cant just rely on error<maxerror loop
cellOfInterval=cell(1,31);
while (error<=threshold)
    if loop==1
        interval=period([1:1:31]);
    else
        
            firstpart=interval([1:i]);
            secondpart=interval([i+2:end]);
            interval=[firstpart,secondpart];
        
    end
age=[157;158;170;171;172;173;181;170;171;265;267;269;242;202;204;205;206;207;208;209;210;229;230;231;232;233;234;235;236;237;239];
y=interp1(period(interval),age(interval),1:0.001:31);
string=stringGen(period(interval),age(interval));
missing_entries=period;%directly calculate for all values;
agebyInterpolation=interp1(period(interval),age(interval),missing_entries);
loop
error=sqrt(sum((age'-agebyInterpolation).^2)/numel(age))
errorList(loop)=error;
cellOfInterval{1,loop}=interval;
if(loop>25)
figure 
plot(period(interval),age(interval),'o',1:0.001:31,y,'r',period,age,'*');
end
if numel(interval)~=2
i=findi(interval,period,age);
else
    break;
end
loop=loop+1;
end
figure
plot(errorList)

figure 
plot(period(interval),age(interval),'o',1:0.001:31,y,'r',period,age,'*');