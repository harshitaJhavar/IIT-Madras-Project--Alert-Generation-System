function [ output_args ] = rule2( prev,current )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%% positive to negative
switch current
    case 'D'
        if or(prev=='B',prev=='C')
            verb=rule1(prev);
            sentence=strcat('Though there was ',verb,'however, the age suddenly started ',strcat(rule1(current),'ing'));
            disp(sentence);
        end
    case 'B'
        if or(prev=='D',prev=='E')
            verb=rule1(prev);
            sentence=strcat('Contrary to previous ',verb,' the age  started ',strcat(rule1(current),'ing'));
            disp(sentence);
        end
    case 'C'
        if or(prev=='D',prev=='E')
            verb=rule1(prev);
            sentence=strcat('After the',verb,', the age suddenly started ',strcat(rule1(current),'ing'));
            disp(sentence);
            
        end
    case 'E'
        if or(prev=='B',prev=='C')
           verb=rule1(prev);
           sentence=strcat('Though there was ',verb,'however, the age suddenly started ',strcat(rule1(current),'ing'));
           disp(sentence);
            
        end
    
        verb=rule1(prev);
        sentence=strcat('it is becoming stable after ',verb);
        disp(sentence);
end

