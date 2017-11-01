function varargout = untitled2(varargin)
% UNTITLED2 MATLAB code for untitled2.fig
%      UNTITLED2, by itself, creates a new UNTITLED2 or raises the existing
%      singleton*.
%
%      H = UNTITLED2 returns the handle to a new UNTITLED2 or the handle to
%      the existing singleton*.
%
%      UNTITLED2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED2.M with the given input arguments.
%
%      UNTITLED2('Property','Value',...) creates a new UNTITLED2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled2

% Last Modified by GUIDE v2.5 27-Jul-2016 01:37:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled2_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled2 is made visible.
function untitled2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled2 (see VARARGIN)

% Choose default command line output for untitled2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.slider1, 'min',1,'max',31,'val',30,'sliderstep',[1/30 1/15]);
 period=1:1:31;  
  interval=period([1:1:31])
  age=[157;158;170;171;172;173;181;170;171;265;267;269;242;202;204;205;206;207;208;209;210;229;230;231;232;233;234;235;236;237;239];
        y=interp1(period(interval),age(interval),1:0.001:31);
        string=stringGen(period(interval),age(interval))
        missing_entries=period;%directly calculate for all values;
        agebyInterpolation=interp1(period(interval),age(interval),missing_entries);
        error=sqrt(sum((age'-agebyInterpolation).^2)/numel(age));
        set(handles.textbox1,'String',error);
          %% initial plot
        axes(handles.axes1)
        cla
        plot(period(interval),age(interval),'o',1:0.001:31,y,'b',period,age,'*');
        y1=get(gca,'ylim');
        hold on
        [r c]=size(interval);
        for k=1:c
            interval(k);
            axes(handles.axes1)
            plot([interval(k) interval(k)],y1,':.')
            hold on
        end
       % xlabel(sprintf('%d interval \n string %s',step,string ));
        set(handles.textbox2,'String',string);
        set(handles.textbox3,'String',1);
% UIWAIT makes untitled2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function textbox1_Callback(hObject, eventdata, handles)
% hObject    handle to textbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox1 as text
%        str2double(get(hObject,'String')) returns contents of textbox1 as a double


% --- Executes during object creation, after setting all properties.
function textbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
        period=1:1:31;
        valueOfSlider=31-round(get(handles.slider1,'Value'))
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
        set(handles.textbox1,'String',error);
        
        
        
        %% initial plot
        axes(handles.axes1)
        cla
        plot(period(interval),age(interval),'o',1:0.001:31,y,'b',period,age,'*');
        y1=get(gca,'ylim');
        hold on
        [r c]=size(interval);
        for k=1:c
            interval(k);
            axes(handles.axes1)
            plot([interval(k) interval(k)],y1,':.')
            hold on
        end
       % xlabel(sprintf('%d interval \n string %s',step,string ));
        set(handles.textbox2,'String',string);
        set(handles.textbox3,'String',step);
% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function textbox2_Callback(hObject, eventdata, handles)
% hObject    handle to textbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox2 as text
%        str2double(get(hObject,'String')) returns contents of textbox2 as a double


% --- Executes during object creation, after setting all properties.
function textbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function textbox3_Callback(hObject, eventdata, handles)
% hObject    handle to textbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textbox3 as text
%        str2double(get(hObject,'String')) returns contents of textbox3 as a double


% --- Executes during object creation, after setting all properties.
function textbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
