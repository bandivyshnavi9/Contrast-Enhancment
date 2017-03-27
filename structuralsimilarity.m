%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         % 
%                                                                         % 
%                                                                         %
%     This function performs one of the evaluation method i.e,            %
%      structural_similarity(relative structural_smilarity)               %
%                                                                         %     
%      Input parameters are:                                              %
%      images:set of original images                                      %
%      final:set of contrast enhanced images                              %       
%                                                                         %
%     Output parameters are:                                              %
%     structure_similarity:set of relative structural_similarity for given%
%                           images                                        %
%                                                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function structure_similarity=structuralsimilarity(images,final)
k1=0.01;
k2=0.03;
l=255;
c1=square(k1.*l);
c2=square(k2.*l);
[A,B,C]=size(images);
%for i=1:A
b1=images(1,:,:);
I1=b1(1,1);
I=I1;
X=double(I);
[o,n]=size(X)
%for j=1:A
b2=final(1,:,:);
I3=b2(1,1);
I2=I3{1,:,:};
Y=double(I2);
[p,q]=size(Y)
xme=mean(X(:));
yme=mean(Y(:));
xv=var(X(:));
yv=var(Y(:));
cxy1=cov(X(:),Y(:));
cxy=cxy1(1,2);
structure_similarity(1,1)=(((2.*xme.*yme)+c1).*((2.*cxy)+c2)./((square(xme)+square(yme)+c1).*(xv+yv+c2)));

%end
%end
end