%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         % 
%                                                                         % 
%                                                                         %
%     This function performs the number of splits defined by the user on  %
%     the matrix obtained from pre-process function.(embedded process)    %
%                                                                         %     
%      Input parameters are:                                              %
%      I:pre-processed matrix                                             %
%      l:number of splits                                                 %
%      bk:message bit to be hide in the image                             %
%                                                                         %       
%                                                                         %
%     Output parameters are:                                              %
%     Bin:processed matrix after l splits                                 %
%     ma1,ma2 are max values at lth split                                 %
%                                                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [Bin,ma1,ma2]=split(I,l,bk)
    %Bk=dec2bin(k);
    [a,b]=size(I);
    Bin = I;
    maxValues =unique(I);
    [mv1,soi] = sort(maxValues,'descend');
    ma1=dec2bin(mv1(1));
    ma2=dec2bin(mv1(2));
    for M=1:l
        for i=1:a
            for j=1:b
                d=dec2bin(Bin(i,j));
                if I(i,j) < mv1(2)
                    k=bin2dec(d)+1;
                    Bin(i,j)=k;
                elseif d==ma2
                    k=bin2dec(d)-bk;
                    Bin(i,j)=k;
                elseif ma2<d & d<ma1
                    k=bin2dec(d);
                    Bin(i,j)=k;
                elseif d==ma1
                    k=bin2dec(d)+bk;
                    Bin(i,j)=k;
                else
                    k=bin2dec(d)-1;
                    Bin(i,j)=k;
                end
            end
        end
        %bi=bin2dec(Bin);
        %m1=ma1;
        %m2=ma2;
        maxValues =unique(Bin);
        [mv1,soi] = sort(maxValues,'descend');
        ma1=mv1(1);
        ma2=mv1(2);
    end
end

