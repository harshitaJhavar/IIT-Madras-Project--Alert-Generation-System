zeta=.5;
wn=2;
sys=tf(wn^2,[1,2*zeta*wn,wn^2]);
fi=figure;
ax=axes('Parent',fi,'position',[0.13,0.39,0.77,0.54]);
h=stepplot(ax,sys);
setoptions(h,'XLim',[0,10],'YLim',[0,2]);
%% slider
b=uicontrol('Parent',fi,'Style','slider','Position',[81,54,419,23],...
'value',zeta,'min',0,'max',1);
bgcolor=fi.Color;
bl1=uicontrol('Parent',fi,'Style','text','Position',[50,54,23,23],...
    'String','0','BackgroundColor',bgcolor);
bl2=uicontrol('Parent',fi,'Style','text','Position',[50,54,23,23],...
    'String','1','BackgroundColor',bgcolor);
bl3=uicontrol('Parent',fi,'Style','text','Position',[240,25,100,23],...
    'String','Damping Ratio','BackgroundColor',bgcolor);
b.callback=@(es,ed)updateSystem(h,tf(wn^2,[1,2*(es.value)*wn,wn^2]));