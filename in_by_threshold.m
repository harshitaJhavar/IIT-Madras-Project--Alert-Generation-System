function varargout = in_by_threshold(varargin)
% IN_BY_THRESHOLD MATLAB code for in_by_threshold.fig
%      IN_BY_THRESHOLD, by itself, creates a new IN_BY_THRESHOLD or raises the existing
%      singleton*.
%
%      H = IN_BY_THRESHOLD returns the handle to a new IN_BY_THRESHOLD or the handle to
%      the existing singleton*.
%
%      IN_BY_THRESHOLD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IN_BY_THRESHOLD.M with the given input arguments.
%
%      IN_BY_THRESHOLD('Property','Value',...) creates a new IN_BY_THRESHOLD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before in_by_threshold_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to in_by_threshold_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help in_by_threshold

% Last Modified by GUIDE v2.5 28-Jul-2016 22:27:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @in_by_threshold_OpeningFcn, ...
                   'gui_OutputFcn',  @in_by_threshold_OutputFcn, ...
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


% --- Executes just before in_by_threshold is made visible.
function in_by_threshold_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to in_by_threshold (see VARARGIN)

% Choose default command line output for in_by_threshold
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.slider1, 'min',0,'max',1,'val',0,'sliderstep',[1/10 1/2]);
    period=1:1:31;  
  interval=period([1:1:31])
  age=[157;158;170;171;172;173;181;170;171;265;267;269;242;202;204;205;206;207;208;209;210;229;230;231;232;233;234;235;236;237;239];
        y=interp1(period(interval),age(interval),1:0.001:31);
        string=stringGen(period(interval),age(interval))
        missing_entries=period;%directly calculate for all values;
        agebyInterpolation=interp1(period(interval),age(interval),missing_entries);
        error=sqrt(sum((age'-agebyInterpolation).^2)/numel(age));
        set(handles.error_tb,'String',error);
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
        set(handles.string_tb,'String',string);
        set(handles.tolerance_tb,'String',0);
        %set(handles.interval_tb,'String',mat2str(interval));
% UIWAIT makes in_by_threshold wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = in_by_threshold_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in error.
function error_Callback(hObject, eventdata, handles)
% hObject    handle to error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of error



function error_tb_Callback(hObject, eventdata, handles)
% hObject    handle to error_tb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of error_tb as text
%        str2double(get(hObject,'String')) returns contents of error_tb as a double


% --- Executes during object creation, after setting all properties.
function error_tb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to error_tb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in intervals.
function intervals_Callback(hObject, eventdata, handles)
% hObject    handle to intervals (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of intervals



function interval_tb_Callback(hObject, eventdata, handles)
% hObject    handle to interval_tb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of interval_tb as text
%        str2double(get(hObject,'String')) returns contents of interval_tb as a double


% --- Executes during object creation, after setting all properties.
function interval_tb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to interval_tb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in string.
function string_Callback(hObject, eventdata, handles)
% hObject    handle to string (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of string



function string_tb_Callback(hObject, eventdata, handles)
% hObject    handle to string_tb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of string_tb as text
%        str2double(get(hObject,'String')) returns contents of string_tb as a double


% --- Executes during object creation, after setting all properties.
function string_tb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to string_tb (see GCBO)
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
%% mycode of callback %%
 valueOfSlider=get(handles.slider1,'Value')
 threshold=valueOfSlider*35.7339;
 error=0;
 errorList=[];
 loop=1;
 period=1:1:31; 
while (error<=threshold)
    if loop==1
        interval=period([1:1:31]);
    else
        
            firstpart=interval([1:p]);
            secondpart=interval([p+2:end]);
            interval=[firstpart,secondpart];
        
    end
age=[157;158;170;171;172;173;181;170;171;265;267;269;242;202;204;205;206;207;208;209;210;229;230;231;232;233;234;235;236;237;239];
y=interp1(period(interval),age(interval),1:0.001:31);
%string=stringGen(period(interval),age(interval));
missing_entries=period;%directly calculate for all values;
agebyInterpolation=interp1(period(interval),age(interval),missing_entries);
error=sqrt(sum((age'-agebyInterpolation).^2)/numel(age))
errorList(loop)=error;
%cellOfInterval{1,loop}=interval;
if numel(interval)~=2
p=findi(interval,period,age);
else
    break;
end
loop=loop+1;
end
%figure
%plot(errorList)
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
 set(handles.tolerance_tb,'String',num2str(valueOfSlider));
 set(handles.error_tb,'String',num2str(errorList(loop-1)));
 string=stringGen(period(interval),age(interval));
 set(handles.string_tb,'String',string);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in interval.
function interval_Callback(hObject, eventdata, handles)
% hObject    handle to interval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of interval


% --- Executes on button press in tolerance.
function tolerance_Callback(hObject, eventdata, handles)
% hObject    handle to tolerance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of tolerance



function tolerance_tb_Callback(hObject, eventdata, handles)
% hObject    handle to tolerance_tb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tolerance_tb as text
%        str2double(get(hObject,'String')) returns contents of tolerance_tb as a double


% --- Executes during object creation, after setting all properties.
function tolerance_tb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tolerance_tb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
