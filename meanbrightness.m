%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         % 
%                                                                         % 
%                                                                         %
%     This function performs one of the evaluation method i.e,            %
%      mean_brightness(relative mean_brightness error)                    %
%                                                                         %     
%      Input parameters are:                                              %
%      images:set of original images                                      %
%      final:set of contrast enhanced images                              %       
%                                                                         %
%     Output parameters are:                                              %
%     mean_brighntess:set of relative mean_brightness error for           %
%       given images                                                      %
%                                                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function mean_brightness=meanbrightness(images,final)
[A,B,C]=size(images);
binimg=zeros(8);
bifin=zeros(8);
%for i=1:A
b1=images(1,:,:);
I1=b1(1,1);
I=I1;
[b,c]=size(I);
x=b.*c;
X=double(I);
X1=sum(X(:));
bimg(1,1)=(X1./x);
X1=0;
x=0;
%end
%for j=1:A
b2=final(1,:,:);
I3=b2(1,1);
I2=I3{:,:};
[l,d]=size(I2);
y=l.*d;
Y=double(I2);
Y1=sum(Y(:));
bifin(1,1)=(Y1./y);
Y1=0;
y=0;
%end
%for k=1:A
    mean_brightness(1,1)=(abs(bimg(1,1)-bifin(1,1)))./bimg(1,1);
%end

end