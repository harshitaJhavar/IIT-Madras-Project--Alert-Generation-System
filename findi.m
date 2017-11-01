function [ i,agebyInterpolation] = findi( interval,period,age )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
min=100;
interval
for k=1:numel(interval)-2
    %% check which pair is minimal
    p=interval(k);
    q=interval(k+1);
    r=interval(k+2);
    period([p,r]);
    age([p,r]);
    age(p+1:r-1);
    if p==1
    agebyInterpolation=interp1(period([p,r]),age([p,r]),period(p:r));
    
    error=sqrt(sum((age(p:r)'-agebyInterpolation).^2)/numel(age(p:r)));
    if min>error
        min=error;
        i=k;
    end
    break;
    end
end

