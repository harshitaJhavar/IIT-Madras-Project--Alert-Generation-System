function [ nature ] = rule1(s,avg)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
switch s
    case 'A'
        nature=strcat(' stablility on an average value of ',avg);
    case 'B'
        nature=' a shallow increase ';
    case 'C'
        nature=' a steep increase ';
    case 'D'
        nature=' an extremely steep increase';
    case 'E'
        nature=' a gradual decrease ';
    case 'F'
        nature=' a sharp decrease  ';
        
    case 'G'
        nature=' an extremely sharp decrease';
        
end

end

