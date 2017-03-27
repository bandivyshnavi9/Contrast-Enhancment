%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         % 
%                                                                         % 
%                                                                         %
%     This function performs one of the evaluation method i.e,            %
%      entropy(relative entropy error)                                    %
%                                                                         %     
%      Input parameters are:                                              %
%      images:set of original images                                      %
%      final:set of contrast enhanced images                              %       
%                                                                         %
%     Output parameters are:                                              %
%     entropy_value:set of relative entropy_error for given images        %
%                                                                         %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function entropy_value = entropy(images,final)
n=256;
[A,B,C]=size(images);
%for i=1:A
b1=images(1,:,:);
I1=b1(1,1);
I=I1;
x = double(I);                        % Make input double
xh = hist(x(:), n);                   % Compute N-bin histogram
xh = xh / sum(xh(:));                 % Compute probabilities  

% Make mask to eliminate 0's since log2(0) = -inf.
in = find(xh);           

E1(1,1)= -sum(xh(in) .* log2(xh(in)));       % Compute entropy

%end
%for j=1:A
b2=final(1,:,:);
In=b2(1,1);
Im=In{:,:};
xn = double(Im);                        % Make input double
xh1 = hist(xn(:), n);                   % Compute N-bin histogram
xh1 = xh1 / sum(xh1(:));                 % Compute probabilities  

% Make mask to eliminate 0's since log2(0) = -inf.
i = find(xh1);           

E2(1,1)= -sum(xh1(i) .* log2(xh1(i)));       % Compute entropy
%end
%disp(E1);
%disp(E2);
[a,b]=size(E1);
for k=1:a
entropy_value(k,1)=(((abs(E1(k,1)-E2(k,1))))./E1(k,1));
end
end