%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         % 
%                                                                         % 
%                                                                         %
%     This function performs to retrieve the message bit that has been    %
%     used after performimg l splits.                                     %
%                                                                         %     
%      Input parameters are:                                              %
%      m1,m2:max values in the array at lth split                         %
%      bi:array after l splits.                                           %
%                                                                         %       
%                                                                         %
%     Output parameters are:                                              %
%     ibk:message bit retrieved during extraction process                 %
%                                                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function ibk=retrieve(m1,m2,bi)
[a,b]=size(bi);
ibk=0;
for i=1:a
    for j=1:b
        if bi(i,j)==(m2-1)|bi(i,j)==(m1+1)
            ibk=0;
        elseif bi(i,j)==m1|bi(i,j)==m2
            ibk=1;
        end
    end
end
end
