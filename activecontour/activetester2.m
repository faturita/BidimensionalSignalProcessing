for l=1:NUMBEROFFRAMES   
    I = imread( sprintf( '%s\\%s', DIRECTORY, sprintf(FILENAMEMASK,l) ));
    I = I (:,:,1);

    for i=1:Na    
        Lout2=[];
        for j=1:size(Lout,1)
            P=Lout(j,:);
            Pvi=(1.0/(sqrt(2 * pi) * sigmai^2)) * exp(-(double(I(P(1),P(2))) - mediai)^2/(2*sigmai^2) );
            Pvo=(1.0/(sqrt(2 * pi) * sigmao^2)) * exp(-(double(I(P(1),P(2))) - mediao)^2/(2*sigmao^2) );

            Fd = log(Pvi/Pvo);

            
            % SI Fd < 0 entonces, la P(el punto P es interior) es MAYOR que
            % la P(el punto P es exterior).  Ergo, lo saco de Lout.
            %Fd = abs( double(I(P(1),P(2))) - baseAvg ) - epsilon;
            if (Fd>0)
                % NO LO COPIO A Lout2 (entonces lo estoy borrando).
                Lin=[Lin; P];
                FI(P(1),P(2)) = -1;

                N4=calculateN4(I,P);

                for jj=1:size(N4,1)
                    Y=N4(jj,:);
                    if (FI(Y(1),Y(2))==3)
                        Lout2=[Lout2; Y];
                        FI(Y(1),Y(2)) = 1;
                    end
                end
            else
                Lout2 = [Lout2; P];
            end
        end
        Lout=Lout2;
        % --------------

        Lin2=[];
        for j=1:size(Lin,1)
            P=Lin(j,:);
            if ( ~(shouldBeInLin(I,FI,Lin,Lout,P)))
                FI(P(1),P(2)) = -3;
            else
                Lin2 = [Lin2; P];
            end
        end
        Lin=Lin2;
        % --------
        Lin2=[];
        for j=1:size(Lin,1)
            P=Lin(j,:);
            Pvi=(1.0/(sqrt(2 * pi) * sigmai^2)) * exp(-(double(I(P(1),P(2))) - mediai)^2/(2*sigmai^2) );
            Pvo=(1.0/(sqrt(2 * pi) * sigmao^2)) * exp(-(double(I(P(1),P(2))) - mediao)^2/(2*sigmao^2) );

            Fd = log(Pvi/Pvo);
            %Fd = abs( double(I(P(1),P(2))) - baseAvg ) - epsilon;
            
            % SI Fd > 0 entonces, la P(el punto P es exterior) es MAYOR que
            % la P(el punto P es interior).  Ergo, lo saco de Lout.
            %Fd = abs( double(I(P(1),P(2))) - baseAvg ) - epsilon;
            if (Fd<0)
                % NO LO COPIO A Lin2 (entonces lo estoy borrando).
                Lout=[Lout; P];
                FI(P(1),P(2)) = 1;

                N4=calculateN4(I,P);

                for jj=1:size(N4,1)
                    Y=N4(jj,:);
                    if (FI(Y(1),Y(2))==-3)
                        Lin2=[Lin2; Y];
                        FI(Y(1),Y(2)) = -1;
                    end
                end
            else
                Lin2 = [Lin2; P];
            end
        end
        Lin=Lin2;
        % --------------
        Lout2=[];
        for j=1:size(Lout,1)
            P=Lout(j,:);
            if ( ~(shouldBeInLout(I,FI,Lin,Lout,P)))
                FI(P(1),P(2)) = 3;
            else
                Lout2 = [Lout2; P];
            end
        end
        Lout=Lout2;
        %-------
        Lout=unique(Lout,'rows','stable');
        Lin=unique(Lin,'rows','stable');


    end

% imfilter con fspecial

% ---- SEGUNDA PASADA
%     a = ceil(mean(Lin));
%     b = ceil(std(Lin));
%     LL=FI( a(1)-b(1)*2:a(1)+b(1)*2, a(2)-b(2)*2:a(2)+b(2)*2);
%     LL = conv2(LL, gauss2d( LL, (size(LL,1)/3), [size(LL,1)/2 size(LL,2)/2]),'same');
%     FS = FI;
%     FS( a(1)-b(1)*2:a(1)+b(1)*2, a(2)-b(2)*2:a(2)+b(2)*2)=LL;
    %FI = conv2(FI, gauss2d( FI, (size(FI,1)/3), [size(FI,1)/2 size(FI,2)/2]));

% for i=1:Ng    
%     Lout2=[];
%     for j=1:size(Lout,1)
%         P=Lout(j,:);
% 
%         if (FS(P(1),P(2))<0)
%             Lin=[Lin; P];
%             FI(P(1),P(2)) = -1;
% 
%             N4=calculateN4(I,P);
%             
%             for jj=1:size(N4,1)
%                 Y=N4(jj,:);
%                 if (FI(Y(1),Y(2))==3)
%                     Lout2=[Lout2; Y];
%                     FI(Y(1),Y(2)) = 1;
%                 end
%             end
%         else
%             %Do nothing
%             Lout2 = [Lout2; P];
%         end
%     end
%     Lout=Lout2;
%     % --------------
%     
%     Lin2=[];
%     for j=1:size(Lin,1)
%         P=Lin(j,:);
%         if ( ~(shouldBeInLin(I,FI,Lin,Lout,P)))
%             FI(P(1),P(2)) = -3;
%         else
%             Lin2 = [Lin2; P];
%         end
%     end
%     Lin=Lin2;
%     % --------
%     Lin2=[];
%     for j=1:size(Lin,1)
%         P=Lin(j,:);
%         
%         if (FS(P(1),P(2))<0)
%             Lout=[Lout; P];
%             FI(P(1),P(2)) = 1;
% 
%             N4=calculateN4(I,P);
%             
%             for jj=1:size(N4,1)
%                 Y=N4(jj,:);
%                 if (FI(Y(1),Y(2))==-3)
%                     Lin2=[Lin2; Y];
%                     FI(Y(1),Y(2)) = -1;
%                 end
%             end
%         else
%             %Do nothing
%             Lin2 = [Lin2; P];
%         end
%     end
%     Lin=Lin2;
%     % --------------
%     Lout2=[];
%     for j=1:size(Lout,1)
%         P=Lout(j,:);
%         if ( ~(shouldBeInLout(I,FI,Lin,Lout,P)))
%             FI(P(1),P(2)) = 3;
%         else
%             Lout2 = [Lout2; P];
%         end
%     end
%     Lout=Lout2;
%     %-------
%     Lout=unique(Lout,'rows','stable');
%     Lin=unique(Lin,'rows','stable');
% 
% 
% end

 
    imshow(redrawI(I,Lin,Lout));
    pause(0.0001);
end