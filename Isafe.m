% Asigna el valor "val" a la imagen I() pero chequeando los limites (i,j) para que no se pasen (x eso es SAFE)
function I= Isafe(I,i,j,val)
if (i>0 && i<=size(I,1) && j>0 && j<=size(I,2))
    I(i,j) = val;
end
end

