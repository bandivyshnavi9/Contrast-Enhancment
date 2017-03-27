%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         % 
%                                                                         % 
%                                                                         %
%     This function performs one of the evaluation method i.e,            %
%      psnr                                                               %
%                                                                         %     
%      Input parameters are:                                              %
%      images:set of original images                                      %
%      final:set of contrast enhanced images                              %       
%                                                                         %
%     Output parameters are:                                              %
%     psnr_value:set of psnr_value for given images                       %
%                                                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function psnr_value=psnr(images,final)
[A,B,C]=size(images);
%for i=1:A
b1=images(1,:,:);
I1=b1(1,1);
I=I1;
X=double(I);
%for j=1:A
b2=final(1,:,:);
[M,N]=size(b2);
I2=b2(1,1);
Y1=I2{:,:};
[m1,m2]=size(Y1);
Y=double(Y1);
error=0;
%for e=1:512
 %   for d=1:512
s=square((X(:)-Y(:)));
error=error+s;
  %  end
%end
mean_value= (sum(error)./ square(255));

if(mean_value > 0)
    psnr_value(1,1) = (10.*log((255.*255)./mean_value))./ log(10);
else
  psnr_value(1,1) = 99;
%end 
%mean_value=0;
%end
end