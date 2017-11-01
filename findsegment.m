function [ ymin,xmin,erSeg ] = findsegment( k ,data,handles)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

data_to_segment=data(2:end-1);
period=[1:numel(data)];
y=data_to_segment;

x=(2:numel(data)-1);

firstx=1;
lastx=numel(data);
firsty=data(firstx);
lasty=data(lastx);

choosen_y=nchoosek(y,k-1);
choosen_x=nchoosek(x,k-1);
error=zeros(numel(choosen_y(:,1),1));

for row=1:numel(choosen_y(:,1));

y_Int=[firsty,choosen_y(row,:),lasty];
x_Int=[firstx,choosen_x(row,:),lastx];
yhat=interp1(x_Int,y_Int,1:0.001:lastx);
yc=interp1(x_Int,y_Int,x);
%row

error(row)=sqrt(sum((y-yc).^2)/numel(y));
%error(row)=finderror(x_Int,yc,[firstx,x,lastx],[firsty,y,lasty]);


%figure
%plot(x_Int,y_Int,'o',period,data,'r',period,data,'*',1:0.001:lastx,yhat,'b');


end
[mine,ind]=min(error(:));
ymin=[firsty,choosen_y(ind,:),lasty];
xmin=[firstx,choosen_x(ind,:),lastx];
yhat=interp1(xmin,ymin,1:0.001:lastx);
yc=interp1(xmin,ymin,x);
erSeg=finderror(xmin,ymin,[firstx,x,lastx],[firsty,y,lasty]);
e=sqrt(sum((y-yc).^2)/numel(y));
%figure
axes(handles.axes1)
cla
plot(period,data,'r',1:0.001:lastx,yhat,'b',xmin,ymin,'o',period,data,'*');
%axis([0,30,-1,1])
title('Defect-Age Time Series Graph')
xlabel('Date')
ylabel('Total Defect Age')
legend('Original Plot', 'Segmented Approximation')
end

