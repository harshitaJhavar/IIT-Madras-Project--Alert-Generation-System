string=['E','A','B','A','A'];
c=string(1);
cid=1;
n=string(1);
nid=1;
msg=strcat('Initially, there was a ' ,rule1(c),' in the defect age value.');
disp(msg);
while nid<numel(string)
    c=string(nid);
    nid=nid+1;
    n=string(nid);
    if(or(c=='D',c=='E'))
        if(or(n=='C',n=='B'))
            msg=strcat('In contrast, it shows ',rule1(n), ' in its value.');
            disp(msg)
        else
            if(or(n=='E',n=='D'))
                msg=strcat('Moreover, there was again ',rule1(n),'in its value.');
                disp(msg)
            else
                msg=strcat('After this ',rule1(c),',',' it followed stability.');
                disp(msg)
            end
        end
        
    else
        if(or(c=='C',c=='B'))
            
            if(or(n=='E',n=='D'))
                msg=strcat('However, there was ',rule1(n), 'in it.');
                disp(msg)
            else
                if(or(n=='C',n=='B'))
                    msg=strcat('Further, there was again ',rule1(n),' in its value.');
                    disp(msg)
                else
                    msg=strcat('After this ',rule1(c),', it became stable.');
                    disp(msg)
                end
            end
            
        else
            if(or(n=='C',n=='B'))
                msg=strcat('It is followed by a ',rule1(n), ' in its value.');
                disp(msg)
            else
                if(or(n=='E',n=='D'))
                    msg=strcat('It follows a ',rule1(n), ' in its value.');
                    disp(msg)
                else
                    msg=strcat('Further, this value continued to be stable.');
                    disp(msg)
                end
            end
        end
        
    end
    
end
