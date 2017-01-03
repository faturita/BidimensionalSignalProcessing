function fig = getParentFigure(hObject)
% if the object is a figure or figure descendent, return the
% figure. Otherwise return [].
fig = get(hObject,'Parent');
while ~isempty(fig) & ~strcmp('figure', get(fig,'type'))
  fig = get(fig,'parent');
end

end

