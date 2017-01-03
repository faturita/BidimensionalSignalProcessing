function value=shouldBeInLin(I,FI,Lin,Lout,P)

value=0;
if (FI(P(1),P(2))<0)
    
    N4 = calculateN4(I,P);
    
    for u=1:4
        if (FI(N4(u,1),N4(u,2))>0)
            value=1;
        end
    end
end

end

