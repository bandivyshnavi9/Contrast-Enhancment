%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     (embedded process)                                 %
%     Input parameters for this function are                             %
%          I:pixel values of the image                                   %
%          l:number of splits defined by the user                        %
%                                                                        %
%                                                                        %
%     The function returns the out parameter                             %
%      T:The pixel values of image processed for l splits inorder to     %
%      overcome underflow or overflow of boundary values.                %
%                                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function T= preprocess(I,l)
T=zeros(512,512);
[a,b]=size(I);
for i = 1:a
    for j=1:b
        c=I(i,j);
    if((c >=0)||(c<=(L-1)))
      T(i,j)=plus(c,1);
  elseif ((c >=255)||(c<=(256-l)))
   T(i,j) = minus(c,1);
    else
        T(i,j)=c;
    end
    end
end
end