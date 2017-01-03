function I= Isafe(I,i,j,val)
if (i>0 && i<=size(I,1) && j>0 && j<=size(I,2))
    I(i,j) = val;
end
end

