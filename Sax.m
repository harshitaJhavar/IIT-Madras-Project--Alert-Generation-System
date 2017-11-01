period=[1:1:31];
age=[157;158;170;171;172;173;181;170;171;265;267;269;242;202;204;205;206;207;208;209;210;229;230;231;232;233;234;235;236;237;239];
%% normalise timeseries %%
[n m]=size(age);

m=mean(age(:));
sd=std(age(:));
nage=age-m;
nage=nage/sd;
w=n/2;
C=[];
for i=1:w
    x=0;
     p=(n/w)*(i-1)+1
     q=(n/w)*i
    for j=int32(p):int32(q)
        x=x+nage(j);
        
    end  
    x=x*(w/n);
    C=[C;x];
end
ageplot=[]
for i=1:w
    p=(n/w)*(i-1)+1;
    q=(n/w)*i;
    for j=int32(p):int32(q)
        ageplot(j)=C(i);
    end
end
ageplot(29)=ageplot(28);ageplot(30)=ageplot(28);ageplot(31)=ageplot(28);
plot(period,nage,'color','r');hold on;
plot(period,ageplot,'color','b');
a=3;
S=[];
Breakpoint=csvread('Breakpoint.csv');
B=Breakpoint(1:3,2)';
C=C';
[r,c]=size(C);
S=[]
for i=1:c
    if(C(1,i)<B(1,1))
        
        S=[S 'l']
    else
        if(C(1,i)<=B(1,2))
            S=[S 'mz']
        else
            if(C(1,i)<=B(1,3))
                S=[S 'h']
            else
                S=[S 'V']
            end
        end
    end
end
csvwrite('codeString',S);
[r,c]=size(S);

S=sprintf('In the initital  %s',c);
 disp(S)

    