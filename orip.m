%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         % 
%                                                                         % 
%                                                                         %
%     This function performs to extraction of compressed data during      %
%     embedded process                                                    %
%                                                                         %
%                                                                         %     
%      Input parameters are:                                              %
%      m1,m2:max values in the array at lth split                         %
%      bi:array after l splits.                                           %
%                                                                         %       
%                                                                         %
%     Output parameters are:                                              %
%     oi:final image matrix                                               %
%                                                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function oi=orip(m1,m2,bi)
[a,b]=size(bi);
oi=bi;
for i=1:a
    for j=1:b
    d=dec2bin(bi(i,j));
   if d < (m2-1)
           oi(i,j)= bin2dec(d)+1;
        elseif d==(m2-1)|d==m2
            oi(i,j)=m2;
        elseif d==m1 |d==(m1+1)
            oi(i,j)=m1;
        elseif d>(m1+1)
            oi(i,j)=bin2dec(d)-1;
   end
    end
    
 end
end
