function [ ymin,xmin ] = findsegment2( k ,data)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%% conversion back to xmin 1:30
%period=[1:numel(ex')];
%period=(period-min(period))/(max(period)-min(period));
%[sharedVals,idxsIntoPeriod] = intersect(period,xmin);
%xmin=idxsIntoPeriod;
%% normalisation

dataY=(data-min(data))/(max(data)-min(data));
period=[1:numel(data)];

dataX=(period-min(period))/(max(period)-min(period))
data_to_segment=dataY(2:end-1);

y=data_to_segment;
x=dataX(2:end-1);

firstx=dataX(1);
lastx=dataX(numel(dataX));
firsty=dataY(1);
lasty=dataY(numel(dataY));

choosen_y=nchoosek(y,k-1);
choosen_x=nchoosek(x,k-1);
error=zeros(numel(choosen_y(:,1),1));

for row=1:numel(choosen_y(:,1));
%% interpolate at choosen x and y

y_Int=[firsty,choosen_y(row,:),lasty];
x_Int=[firstx,choosen_x(row,:),lastx];
%for plotting firstx:0.001:lastx
plotx=firstx:0.00001:lastx;
ploty=interp1(x_Int,y_Int,plotx);

%actual y after interpolation
yc=interp1(x_Int,y_Int,x);

%% eroor 
error(row)=sqrt(sum((y-yc).^2)/numel(y));
%error(row)=finderror(x_Int,yc,[firstx,x,lastx],[firsty,y,lasty]);


%figure
%plot(x_Int,y_Int,'o',period,data,'r',period,data,'*',1:0.001:lastx,yhat,'b');


end
[mine,ind]=min(error(:));
ymin=[firsty,choosen_y(ind,:),lasty];
xmin=[firstx,choosen_x(ind,:),lastx];
plotx=1:0.001:30;
ploty=interp1(xmin,ymin,ploty);
yc=interp1(xmin,ymin,x);
%e=finderror(xmin,ymin,[firstx,x,lastx],[firsty,y,lasty]);
e=sqrt(sum((y-yc).^2)/numel(y));

figure

plot(xmin,ymin,'o',period,data,'r',period,data,'*',1:0.001:lastx,yhat,'b');

end

