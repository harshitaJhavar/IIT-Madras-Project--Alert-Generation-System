function varargout = MyInterpolationGui(varargin)
% MYINTERPOLATIONGUI MATLAB code for MyInterpolationGui.fig
%      MYINTERPOLATIONGUI, by itself, creates a new MYINTERPOLATIONGUI or raises the existing
%      singleton*.
%
%      H = MYINTERPOLATIONGUI returns the handle to a new MYINTERPOLATIONGUI or the handle to
%      the existing singleton*.
%
%      MYINTERPOLATIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYINTERPOLATIONGUI.M with the given input arguments.
%
%      MYINTERPOLATIONGUI('Property','Value',...) creates a new MYINTERPOLATIONGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MyInterpolationGui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MyInterpolationGui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MyInterpolationGui

% Last Modified by GUIDE v2.5 27-Jul-2016 02:17:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MyInterpolationGui_OpeningFcn, ...
                   'gui_OutputFcn',  @MyInterpolationGui_OutputFcn, ...
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


% --- Executes just before MyInterpolationGui is made visible.
function MyInterpolationGui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MyInterpolationGui (see VARARGIN)

% Choose default command line output for MyInterpolationGui
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
        set(handles.error,'String',error);
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
        set(handles.string,'String',string);
        set(handles.interval,'String',1);
% UIWAIT makes MyInterpolationGui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MyInterpolationGui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function error_Callback(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of error as text
%        str2double(get(hObject,'String')) returns contents of error as a double


% --- Executes during object creation, after setting all properties.
function error_CreateFcn(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
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
        set(handles.error,'String',error);
        
        
        
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
        set(handles.string,'String',string);
        set(handles.interval,'String',step);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function string_Callback(hObject, eventdata, handles)
% hObject    handle to string (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of string as text
%        str2double(get(hObject,'String')) returns contents of string as a double


% --- Executes during object creation, after setting all properties.
function string_CreateFcn(hObject, eventdata, handles)
% hObject    handle to string (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function interval_Callback(hObject, eventdata, handles)
% hObject    handle to interval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of interval as text
%        str2double(get(hObject,'String')) returns contents of interval as a double


% --- Executes during object creation, after setting all properties.
function interval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to interval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
