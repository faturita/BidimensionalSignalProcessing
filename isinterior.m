function value = isinterior(I,Lin,Lout,P)

borderY = Lin(find(Lin(:,1)==P(1)),2);
borderX = Lin(find(Lin(:,2)==P(2)),1);


value=0;

    if (size(borderY,1) >0 && size(borderX,1) > 0)

    minBorderY = min(borderY);
    minBorderX = min(borderX);
    maxBorderY = max(borderY);
    maxBorderX = max(borderX);


    if ( minBorderX < P(1) && P(1) < maxBorderX )
        if (minBorderY < P(2) && P(2) < maxBorderY)
            value = 1;
        end
    end
end
end

