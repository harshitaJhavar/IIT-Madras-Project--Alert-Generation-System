function [ segment1,idx1,segment2,idx2 ] =findSegment(segmentinput,idx)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[r,c]=size(segmentinput);
originalsegment=segmentinput;
firstPoint=segmentinput(1);
newsegment=[firstPoint];
newsegment_lastindex=c;
for i=1:c
    i;
    if(i==1)
        for j=i+1:c
            j;
            y2=segmentinput(j);
            y1=segmentinput(i);
            x2=idx(j);
            x1=idx(i);
            slope=(y2 - y1) ./ (x2 - x1);
            if(slope<=1)
                newsegment=[newsegment,y2];
                newsegment_lastindex=x2;
            
            else
                break;
            end
        end
    else
        for j=i+1:newsegment_lastindex
            j;
            y2=segmentinput(j);
            y1=segmentinput(i);
            x2=idx(j);
            x1=idx(1);
            slope=(y2 - y1) ./ (x2 - x1);
            if(slope>1)
                newsegment_lastindex=x2-1;
            end
        end
    end
end
segment1=newsegment
idx1=idx(1:newsegment_lastindex);
idx2=idx(newsegment_lastindex+1:c);
segment2=originalsegment(idx2)


end

