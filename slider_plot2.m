function [] = slider_plot2()
steps=[2,3,5,6,10,30];
period=1:1:31;
step=steps(1);
%% initial interval %%
interval=period([1:step:31])
if step>=7& step~=10 &step~=15 &step~=30
    interval=[interval,31]
end


age=[157;158;170;171;172;173;181;170;171;265;267;269;242;202;204;205;206;207;208;209;210;229;230;231;232;233;234;235;236;237;239];
y=interp1(period(interval),age(interval),1:0.001:31);
string=stringGen(period(interval),age(interval))
missing_entries=period;%directly calculate for all values;
agebyInterpolation=interp1(period(interval),age(interval),missing_entries);


%% Plot different plots according to slider location.
S.fh = figure('units','pixels',...
    'menubar','none',...
    'name','slider_plot',...
    'numbertitle','off',...
    'resize','off');
S.x = 1:1:31;  % For plotting.
%S.ax = axes('unit','pix',...
%           'position',[50 100 260 210]);
%plot(S.x,S.x,'r');
S.t = uicontrol('style','text')
set(S.t,'String','Error')
%% initial plot

plot(period(interval),age(interval),'o',1:0.001:31,y,'b',period,age,'*');
y1=get(gca,'ylim');
hold on
[r c]=size(interval);
for k=1:c
    interval(k);
    plot([interval(k) interval(k)],y1,':.')
    hold on
end
xlabel(sprintf('%d interval \n string %s',step,string ));
error=sqrt(sum((age'-agebyInterpolation).^2)/numel(age));
        set(S.t,'String',num2str(error));
%%


S.sl = uicontrol('style','slide',...
    'unit','pix',...
    'Position', [350 20 150 20],...
    'min',1,'max',31,'val',1,...
    'sliderstep',[1/30 1/15],...
    'callback',{@sl_call,S});
    function [] = sl_call(varargin)
        % Callback for the slider.
        [h,S] = varargin{[1,3]};  % calling handle and data structure.
        cla
        period=1:1:31;
        valueOfSlider=round(get(h,'value'));
        steps=[2,3,5,6,10,15,30];
        [c index] = min(abs(steps-valueOfSlider))
        closestValues = steps(index) % Finds first one only
        step=closestValues;
        %% initial interval %%
        interval=period([1:step:31])
        if step>=7& step~=10 &step~=15 &step~=30
            interval=[interval,31]
        end
        
        
        age=[157;158;170;171;172;173;181;170;171;265;267;269;242;202;204;205;206;207;208;209;210;229;230;231;232;233;234;235;236;237;239];
        y=interp1(period(interval),age(interval),1:0.001:31);
        string=stringGen(period(interval),age(interval))
        missing_entries=period;%directly calculate for all values;
        agebyInterpolation=interp1(period(interval),age(interval),missing_entries);
        error=sqrt(sum((age'-agebyInterpolation).^2)/numel(age));
        set(S.t,'String',num2str(error));
        
        
        
        %% initial plot
        
        plot(period(interval),age(interval),'o',1:0.001:31,y,'b',period,age,'*');
        y1=get(gca,'ylim');
        hold on
        [r c]=size(interval);
        for k=1:c
            interval(k);
            plot([interval(k) interval(k)],y1,':.')
            hold on
        end
        xlabel(sprintf('%d interval \n string %s',step,string ));
        
    end

end