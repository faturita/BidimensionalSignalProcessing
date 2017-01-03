function mytestcallback(hObject,~)
pos=get(hObject,'CurrentPoint');
disp(['You clicked X:',num2str(pos(1)),', Y:',num2str(pos(2))]);

end