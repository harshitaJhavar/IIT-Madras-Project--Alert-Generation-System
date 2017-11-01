
function [ s ,segmentThreshold,avgvalue] = stringGen(period, age,data,Yt,normF)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%% standard vectors %%
a=0;
b=tan(pi/6);
c=tan(pi/3);
d=tan(-pi/6);
e=tan(-pi/3);
%% find slopes of lines and find corresponding alphabet%%
s=[];
%normFactor=(ymax-ymin)/(xmax-xmin);
segmentThreshold=cell(numel(period)-1,2);
avgvalue=zeros(numel(period)-1,1);
for(i=1:numel(period))
    if(i==numel(period))
    break
    else
        j=i+1;
    end
    
    slope=(age(j)-age(i))./(period(j)-period(i));
    [XsegT,YsegT]=findthresholdpoints([period(i),period(j)],[age(i),age(j)],data,Yt);
    
    segmentThreshold{i,1}= XsegT;
    segmentThreshold{i,2}= YsegT;
    if(slope>0)
       if(slope<=normF*tan(pi/30))
           s=[s 'A'];
           avgvalue(i)=(age(j)+age(i))/2;
       else
           if(slope<=tan(pi/4)*normF)
               s=[s 'B'];avgvalue(i)=(age(j)+age(i))/2;
           else
               if(slope<=normF*tan(5*pi/12))
                   s=[s 'C'];avgvalue(i)=(age(j)+age(i))/2;
               else
                   s=[s 'D'];avgvalue(i)=(age(j)+age(i))/2;
               end
           end
       end
    else
        if(slope>=-normF*tan(pi/30))
           s=[s 'A'];
           avgvalue(i)=(age(j)+age(i))/2;
       else
           if(slope>=-tan(pi/4)*normF)
               s=[s 'E'];avgvalue(i)=(age(j)+age(i))/2;
           else
               if(slope>=-normF*tan(5*pi/12))
                   s=[s 'F'];avgvalue(i)=(age(j)+age(i))/2;
               else
                   s=[s 'G'];avgvalue(i)=(age(j)+age(i))/2;
               end
           end
       end
    end


end

