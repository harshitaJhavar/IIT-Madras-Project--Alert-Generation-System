function [ segment ] = finderror( x_Int,y_Int,x,y )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
segment=zeros(1,numel(x_Int)-1);
x_Int;
y_Int;
x;
y;
for i=1:numel(x_Int)-1
    j=i+1;
    %line end points (b,c)
    Xb=x_Int(i);
    Yb=y_Int(i);
    Xc=x_Int(j);
    Yc=y_Int(j);
    b=[Xb,Yb];
    c=[Xc,Yc];
    %point a
    X_interval=[x(find(x>Xb&x<=Xc))];
    Y_interval=[y(X_interval)];
    ds=zeros(numel(X_interval)-1,1);
    for p=1:numel(X_interval)
        Xa=X_interval(p);
        Ya=Y_interval(p);
        a=[Xa,Ya];
        ds(p)=abs( det([a-b;c-b]) )/norm(c-b);
    end
    segment(i)=sum(ds(:))/numel(X_interval);
    
end
%s=sum(segment(:));
%s=s/(numel(x_Int)-1);
end

