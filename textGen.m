function [ M ] = textGen(string,xmin,ymin,segmentThreshold,avgvalue,erSeg)
%string=['E','A','B','A','A'];
c=string(1);
cid=1;
n=string(1);
nid=1;
x1=xmin(cid);
x2=xmin(cid+1);
segmentpointsX=segmentThreshold{1,1};
segmentpointsX=sort(segmentpointsX);
max_error=max(erSeg);
epsilon=max_error/4;
avg=avgvalue(1);
avgvalue;
M=[];
if(numel(segmentpointsX)>1)
    msg2=sprintf('%s%s','However, during this period, there are critical points on Days',' ');
    for p=1:numel(segmentpointsX)-1
        msg2=strcat(msg2,' ',num2str(segmentpointsX(p)),' ,');
        
    end
    % last and add
    msg2=msg2(1:end-1);
    p=p+1;
    msg2=strcat(msg2,' and  ',num2str(segmentpointsX(p)),' . ');
    msg2=strcat(msg2(1:end-1),'. ');
else
    msg2=[];
end
fmax=30;
msg3=[];
if ((x2-x1)+1)> (5*fmax/10)
    msg3=' for a large period  ';
else
    % small period if interval < 30% of total interval
    if((x2-x1)+1)<= (fmax/10)
        msg3=' for a small interval ';
    end
end

%disp(strcat(msg1,msg2));
error=erSeg(1);
if error>epsilon
    
    msg1=strcat('There is ',' ' ,rule1(c,num2str(avg)),' in the defect age value  ',msg3,' from Day ',' ',num2str(x1),' to Day ',' ',num2str(x2),' with some erratic variations. ');
    
else
    
    msg1=strcat('Initially, there is ',' ' ,rule1(c,num2str(avg)),' in the defect age value',msg3,' from Day ',' ',num2str(x1),' to Day ',' ',num2str(x2),'. ');
end

M=sprintf('%s%s',msg1,msg2);
%M=strcat(M,strcat(msg1,msg2));
while nid<numel(string)
    c=string(nid);
    nid=nid+1;
    n=string(nid);
    x1=xmin(nid);
    x2=xmin(nid+1);
    fmax=30;
    error=erSeg(nid);
    avg=avgvalue(nid);
    %% large period if interval >50% of total interval
    msg3=[];
    if ((x2-x1)+1)> (5*fmax/10)
        msg3=' for a large period  ';
    else
        % small period if interval < 30% of total interval
        if((x2-x1)+1)<= (fmax/10)
            msg3=' for a small interval ';
        end
    end
    %% erratic bahaviour messaeg
    
    segmentpointsX=segmentThreshold{nid,1};
    segmentpointsX=sort(segmentpointsX)
    msg2=strcat(' ','However, during this interval, there are critical points on Days',' ');
    if(numel(segmentpointsX)>1)
        if(numel(segmentpointsX)==2)
            msg2=msg2(1:end-4);
            msg2=strcat(msg2,' ','Day');
            msg2=strcat(msg2,' ',num2str(segmentpointsX(2)),' . ');
        else
            if(numel(segmentpointsX)>2)
                for p=2:numel(segmentpointsX)-1 %bcz +1 is done at last
                    msg2=strcat(msg2,' ',num2str(segmentpointsX(p)),' , ');
                    
                end
                msg2=msg2(1:end-1);
                p=p+1
                msg2=strcat(msg2,' and  ',num2str(segmentpointsX(p)),'. ')
                msg2=strcat(msg2(1:end-1),'. ');
                
            end
        end
    else
        msg2=[];
        
    end
%% %% %% %%% negattive%%%%%%%%%%%%%%%%%%
    if(or(or(c=='E',c=='F'),c=='G'))
%% %%%positive
        if(or(or(n=='B',n=='C'),n=='D'))
            %error begin
            if (0<error)&&(error<=epsilon)
                msg=strcat('Then',', from Day ',num2str(x1),' to Day ',num2str(x2),', it shows ',rule1(n,num2str(avg)), ' in its value ',msg3,' with little turbulence. ');
            else
                if error>epsilon
                    msg=strcat('Then',', from Day ',num2str(x1),' to Day ',num2str(x2),', it shows ',rule1(n,num2str(avg)), ' in its value ',msg3,' with high turbulence. ');
                else
                    msg=strcat('Then',', from Day ',num2str(x1),' to Day ',num2str(x2),', it shows ',rule1(n,num2str(avg)), ' in its value ',msg3,'. ');
                    
                end
            end
            %error end
            M=sprintf('%s%s%s',M,msg,msg2);
        else
%% %%%negative           
            if(or(or(n=='E',n=='F'),n=='G'))
                %error begin
                if (0<error)&&(error<=epsilon)
                    msg=strcat('From then onwards, there is again  ',rule1(n,num2str(avg)),' in its value ',msg3, ' till Day ',num2str(x2),' which is exhibiting less irregularities. ');
                else
                    if error>epsilon
                        msg=strcat('From then onwards, there is again  ',rule1(n,num2str(avg)),' in its value ',msg3, ' till Day ',num2str(x2),' which is exhibiting many irregularities. ');
                    else
                        msg=strcat('From then onwards, there is again  ',rule1(n,num2str(avg)),' in its value ',msg3, ' till Day ',num2str(x2),'. ');
                    end
                end
                %error end
                M=sprintf('%s%s%s',M,msg,msg2);
            else
%%   %stable      
               
                %error begin
                if (0<error)&&(error<=epsilon)
                    msg=strcat('After this ',rule1(c),',',' it shows an episodic stability on an average value of ',num2str(avg),' ',msg3,' till Day ', num2str(x2),' ',' with less variations involved. ');
                else
                    if error>epsilon
                        msg=strcat('After this ',rule1(c),',',' it shows an episodic stability on an average value of ',num2str(avg),' ',msg3,' till Day ', num2str(x2),' ',' with high number of  variations involved. ');
                    else
                        msg=strcat('After this ',rule1(c),',',' it shows stability on an average value of ',num2str(avg),' ',msg3,' from Day ',num2str(x1),' to Day ', num2str(x2),'. ');
                    end
                end
                %error end
                M=sprintf('%s%s%s',M,msg,msg2);
            end
            
        end
        
    else
%% %%%%%% %% positive%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if(or(or(c=='B',c=='C'),c=='D'))
%%            %%%negative
            if(or(or(n=='E',n=='F'),n=='G'))
                %error begin
                if (0<error)&&(error<=epsilon)
                    msg=strcat('Then, there is  ',rule1(n,num2str(avg)), ' in its value',msg3,' from Day ',num2str(x1),' to Day ',num2str(x2),' with less erratic variations. ');
                else
                    if error>epsilon
                        msg=strcat('Then, there is  ',rule1(n,num2str(avg)), ' in its value',msg3,' from Day ',num2str(x1),' to Day ',num2str(x2),' with many erratic variations. ');
                    else
                        msg=strcat('Then, there is  ',rule1(n,num2str(avg)), ' in its value',msg3,' from Day ',num2str(x1),' to Day ',num2str(x2),'. ');
                    end
                end
                %error end
                M=sprintf('%s%s%s',M,msg,msg2);
            else
                
%%                %%%positive
                if(or(or(n=='B',n=='C'),n=='D'))
                    %error begin
                    if (0<error)&&(error<=epsilon)
                        msg=strcat('From then onwards with few variations involved, there is again ',rule1(n,num2str(avg)),' in its value ',msg3,' till Date ',num2str(x2),'. ');
                    else
                        if error>epsilon
                            msg=strcat('From then onwards with large number of variations involved, there is again ',rule1(n,num2str(avg)),' in its value ',msg3,' till Date ',num2str(x2),'. ');
                        else
                            msg=strcat('From then onwards, there is again ',rule1(n,num2str(avg)),' in its value ',msg3,' till Date ',num2str(x2),'. ');
                        end
                    end
                    %error end
                    M=sprintf('%s%s%s',M,msg,msg2);
                else
%%                    %%%stable
                    if (0<error)&&(error<=epsilon)
                        msg=strcat('After this ',rule1(c),',along with small turbulence ',' it shows stability on an average value of ',num2str(avg),' ',msg3,' from Day ',num2str(x1),' to Day ', num2str(x2),'. ');
                    else
                        if error>epsilon
                            msg=strcat('After this ',rule1(c),',along with large turbulence ',' it shows stability on an average value of ',num2str(avg),' ',msg3,' from Day ',num2str(x1),' to Day ', num2str(x2),'. ');
                        else
                            msg=strcat('After this ',rule1(c),',',' it shows stability on an average value of ',num2str(avg),' ',msg3,' from Day ',num2str(x1),' to Day ', num2str(x2),'. ');
                        end
                    end
                    %eroor end
                    M=sprintf('%s%s%s',M,msg,msg2);
                end
            end
            
        else
%%  %%%%%%stable%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%       %positive
            if(or(or(n=='B',n=='C'),n=='D'))
                %error begin
                if (0<error)&&(error<=epsilon)
                    msg=strcat('It exhibits some variations which lead to ',rule1(n,num2str(avg)), ' in its value',msg3,' from Day ',num2str(x1),' to Day ',num2str(x2),'. ');
                else
                    if error>epsilon
                        msg=strcat('It exhibits some variations which lead to ',rule1(n,num2str(avg)), ' in its value',msg3,' from Day ',num2str(x1),' to Day ',num2str(x2),'. ');
                    else
                        msg=strcat('It is followed by ',rule1(n,num2str(avg)), ' in its value',msg3,' from Day ',num2str(x1),' to Day ',num2str(x2),'. ');
                    end
                    
                end
                %error end                
                M=sprintf('%s%s%s',M,msg,msg2);
            else
%%                %negative
                if(or(or(n=='E',n=='F'),n=='G'))
                    %error begin
                    if (0<error)&&(error<=epsilon)
                        msg=strcat('It follows  ',rule1(n,num2str(avg)), ' in its value',msg3,' from Day ',num2str(x1),' to Day ',num2str(x2),' with less number of variations involved. ');
                    else
                        if error>epsilon
                            msg=strcat('It follows  ',rule1(n,num2str(avg)), ' in its value',msg3,' from Day ',num2str(x1),' to Day ',num2str(x2),' with many variations involved. ');
                        else
                            msg=strcat('It follows  ',rule1(n,num2str(avg)), ' in its value',msg3,' from Day ',num2str(x1),' to Day ',num2str(x2),'. ');
                        end
                        
                    end
                    %error end
                    
                    M=sprintf('%s%s%s',M,msg,msg2);
                else
                    %%                   %stable
                    if (0<error)&&(error<=epsilon)
                        msg=strcat('This value continued to be stable around value of',num2str(avg),' ',msg3, 'till Day ', num2str(x2),' with  alongside low number of irregularities. ');
                    else
                        if error>epsilon
                            msg=strcat('This value continued to be stable around value of',num2str(avg),' ',msg3, 'till Day ', num2str(x2),' with alongside high numberof irregularities. ');
                        else
                            msg=strcat('This value continued to be stable around value of ',num2str(avg),' ',msg3, 'till Day ', num2str(x2),'. ');
                        end
                    end
                    %error end
                    
                    M=sprintf('%s%s%s',M,msg,msg2);
                end
            end
            
        end
        
    end
end

%%%%%%%%%%%%%%%%%%%%%%% THE END
%%%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%copyright@IIT Madras,Neha
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Dubey,Harshita Jhavar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
