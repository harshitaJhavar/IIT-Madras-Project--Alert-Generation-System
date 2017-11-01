string=['E','A','B','A','A'];
for i=2:numel(string)
    
    switch string(i)
        case 'A'
            if string(i-1)=='A'
                flag=0;
                if(i+1<=numel(string)&string(i+1)=='A')
                    flag=1;
                rule3(string(i-1),string(i),flag)
                else
                   rule3(string(i-1),string(i),flag)
                end
            end
        case 'B'
           if string(i-1)=='B'
                flag=0;
                if(i+1<=numel(string)&string(i+1)=='B')
                    flag=1;
                rule3(string(i-1),string(i),flag)
                else
                   rule3(string(i-1),string(i),flag)
                end
           end
        case 'C'
             if string(i-1)=='C'
                 flag=0;
                if(i+1<=numel(string)&string(i+1)=='C')
                    flag=1;
                rule3(string(i-1),string(i),flag)
                else
                   rule3(string(i-1),string(i),flag)
                end
             end
        case 'D'
            if string(i-1)=='D'
                flag=0;
                if(i+1<=numel(string)&string(i+1)=='D')
                    flag=1;
                rule3(string(i-1),string(i),flag)
                else
                   rule3(string(i-1),string(i),flag)
                end
            end
        case 'E'
             if string(i-1)=='E'
                 flag=0;
                if(i+1<=numel(string)&string(i+1)=='E')
                    flag=1;
                rule3(string(i-1),string(i),flag)
                else
                   rule3(string(i-1),string(i),flag)
                end
             end
    end
    
    rule2(string(i),string(i+1));
end
