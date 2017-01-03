function [Lin, Lout, FI] = contract(I,FI,Lin,Lout,P)
i1=find(Lin(:,1)==P(1));
i2=find(Lin(i1,2)==P(2));
index = i1(i2);
Lin(index,:)=[];

Lout=[Lout; P];

FI(P(1),P(2)) = 1;

N4=calculateN4(P);
for j=1:size(N4,1)
    Y=N4(j,:);
    if (fi(I,FI,Lin,Lout,Y)==-3)
        Lin=[Lin; Y];
        FI(Y(1),Y(2)) = -1;
    end
end

end