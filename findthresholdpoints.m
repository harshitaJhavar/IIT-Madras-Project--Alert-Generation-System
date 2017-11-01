function [ XsegT,YsegT ] = findthresholdpoints( Xseg,Yseg,data,Yt )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

x1=Xseg(1);
x2=Xseg(2);
y1=Yseg(1);
y2=Yseg(2);
%x=a(find(a>=5&a<=8))or x1=a(a>=5&a<=8)
%% find any point in segment greater than single point in Yt.
dataInSeg=data(x1:x2);
indexInSeg=x1:x2;
I=find(dataInSeg>Yt);
YsegT=dataInSeg(I);
XsegT=indexInSeg(I);

end

