function value=fi(I,FI,Lin,Lout,P)
%isInLout = find(Lout(find(Lout(:,1)==P(1)),2)==P(2) );
%isInLin  = find(Lin (find(Lin (:,1)==P(1)),2)==P(2) );

% if (size(isInLout,1)>0)
%     value = 1;
% elseif (size(isInLin,1)>0)
%     value = -1;
% else
    value= FI(P(1),P(2));
% end

end

