%Michael Moloney
%CSC 4630 Homework #10
%Account: mmoloney1
%Due Date: Oct.30,2018

function varargout = letterGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @letterGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @letterGUI_OutputFcn, ...
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

function letterGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

set(handles.letter,'String',char(get(handles.letterChanger,'Value')));

function varargout = letterGUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function letterChanger_Callback(hObject, eventdata, handles)

letterChoice = get(hObject,'Value');
assignin('base','LetterChoice',letterChoice);

set(handles.letter,'String',num2str(char(letterChoice)));

function letterChanger_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
