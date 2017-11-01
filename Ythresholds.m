function [ X,Y ] =Ythresholds(k,data)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n=numel(data);
t=n*k/100;
[D,I]=sort(data,'descend');
%top t percentage
for i=1:t
    yt(i)=D(i);
    xt(i)=I(i);
end
%sort by x
[X,In]=sort(xt,'descend');
Y=yt(In);
