%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         % 
%                                                                         % 
%                                                                         %
%     This function performs one of the evaluation method i.e,            %
%      contrast(relative contrast error)                                  %
%                                                                         %     
%      Input parameters are:                                              %
%      images:set of original images                                      %
%      final:set of contrast enhanced images                              %       
%                                                                         %
%     Output parameters are:                                              %
%     contrast_value:set of relative contrast_error for given images      %
%                                                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function contrast_value=contrast(images,final)
[A,B,C]=size(images);
coim=zeros(8);
cofin=zeros(8);
%for i=1:A
Max=0;
Min=0;
b1=images(1,:,:);
I1=b1(1,1);
I=I1;
X=double(I);
[Max,Im] = max(X(:));
[Min,In] = min(X(:));
coim(1,1)=((Max-Min)./(Max+Min));

%end
%for j=1:A
b2=final(1,:,:);
I3=b2(1,1);
I2=I3{:,:};
Y=double(I2);
[Max2,Im2] = max(Y(:));
[Min2,In2] = min(Y(:));
cofin(1,1)=((Max2-Min2)./(Max2+Min2));
Max2=0;
Min2=0;
%end
%for k=1:A
    contrast_value(1,1)=(abs(coim(1,1)-cofin(1,1)))./coim(1,1);
%end
end
