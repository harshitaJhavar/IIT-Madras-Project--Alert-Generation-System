function [ output_args ] = rule3(prev,current,flag)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
if flag==1
    sentence=strcat('There is continous ',verb(current),'for some period of time');
 disp(sentence);
else
    
 sentence=strcat('after  ',rule1(prev),'again it is',rule1(current));
 disp(sentence);
 

end

