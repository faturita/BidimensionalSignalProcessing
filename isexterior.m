function value=isexterior(I,Lin,Lout,P)

borderY = Lout(find(Lout(:,1)==P(1)),2);
borderX = Lout(find(Lout(:,2)==P(2)),1);

error('fdsfsfd');
value=1;

if (size(borderY,1) >0 && size(borderX,1) > 0)
    
    minBorderY = min(borderY);
    minBorderX = min(borderX);
    maxBorderY = max(borderY);
    maxBorderX = max(borderX);

    value=0;

    if (  P(1) < minBorderX || maxBorderX < P(1) )
        if (P(2) < minBorderY || maxBorderY < P(2))
            value = 1;
        end
    end
end

end

