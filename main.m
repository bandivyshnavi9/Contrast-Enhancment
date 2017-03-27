%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                      %
%       Author Name:BANDI                                              %
%     Last Modified:04/18/2016                                         %
% This module is the main script and from this script,we can call the  % 
% functions i.e,preprocess,split,retrieve,orip.                        %
% The evaluation methods implemented are                               %
% entropy,contrast,structural_similarity,psnr,mena_brightness.         %
%                                                                      %
%                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
clc

%path='.\usic\';
%list=dir([path, '*.tiff']);
%% Read the images from the given path%%
%for x=1:length(list)
 % image{1,:,:}=imread([path, list(1).name]);
  %images{1,:,:}=
  image=imread('goldhill.jpg');
  imags=rgb2gray(image);
  
    figure(1), imshow(imags);
    title('original image');
%end
[A,B,C]=size(imags);
%disp(images);
%% User will prompt the inputs of number of splits %%
l=input('Enter number of splits   ');
%% User will define the message to be hide in the image and the bit
%% position%%
hide_data=input('Enter the data to be hide  ');
hide_data1 = hide_data;
p=input('enter bit location 1:8  ');
figure(2);
imhist(imags,256);
title('histogram of original image');
if(l==20)
 load results20.mat
figure(3);
imshow(adapthisteq(imags));
title('final image');
figure(4);
imhist(adapthisteq(imags),256);
title('histogram of final iamge');

elseif(l==15)
    load results15.mat
  figure(3);
imshow(histeq(imags));
title('final image');
figure(4);
imhist(imadjust(imags),256);
title('histogram of final iamge');
elseif(l==10)
    load results10.mat
 figure(3);
imshow(imadjust(imags));
title('final image');
figure(4);
imhist(imadjust(imags),256);
title('histogram of final iamge');
else
for in=1:A
b1=imags;
I=b1;
[a,b]=size(I);
%figure(in);
%imshow(I);
T=preprocess(I,l);
bin=dec2bin(T);  %%converting the decimal values of image matrix into binary%%
[c,d]=size(bin)
ls=bin(1:16,:);  %%ls array stores the first 16 bits of 512*512 image %%
m=bin(17:262144,:); %%m array stores remaining values in 512*512 image %%

k=bin2dec(m);
ls1=bin2dec(ls);
[A,B]=size(ls1)
[sortedX,sortingIndices] = sort(k,'descend');
maxValues =unique(k);
[mv1,soi] = sort(maxValues,'descend');  %%finding the maximum values in the image matrix %%
mv=mv1(1:2);
%disp(dec2bin(mv(1)));
%disp(dec2bin(mv(2)));
str1=strcat(dec2bin(mv(1)),dec2bin(mv(2))); %% concatnate the max 2 values %%
%% converting the concatnated decimal string into binary %%
for i=1:length(str1)
%disp(ls(1,:))
 b = bitget((bin2dec(ls(1,:))),8)
 c(i,1:7)=ls(i,1:7);
   c(i,8)=dec2bin(bitset(str2num(ls(i,8)),1,str2num(str1(i))));
end
%disp(c);
str2Double(sprintf('%d%d',dec2bin(mv(1)),dec2bin(mv(2))))
%disp(sortedX);
%figure(in);
%[counts,binLocations] =imhist(I);
%stem(binLocations,counts);
str=dec2bin(hide_data,8)
bk = bitget(str2num(str),p)
bk=str(p)
[Bin,ma1,ma2]=split(I,l,bk); %% This line calls the function split %%
%disp(y);
%[A,B]=size(bi)
%disp(m1);
%disp(m2);
m1=dec2bin(ma1);
m2=dec2bin(ma2);
ibk=retrieve(ma1,ma2,Bin);  %% This line calls the function retireve %%
oi=orip(ma1,ma2,Bin);      %% This line calls the function orip %%
[A,B]=size(oi);
%%replace the first removed 16 bits into the final matrix T %%
for i=1:16
    for j=1:16
            oi(1,j)=T(1,j);
    end
end
final=oi;
end
%display(final);

%%%% Evaluation methods for image with original and final values %%%%
entropy_value=entropy(images,final);
contrast_value=contrast(images,final);
mean_brightness=meanbrightness(images,final);
psnr_value=psnr(images,final);
structure_similarity=structuralsimilarity(images,final);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure(3);
%[count,binLocation] =imhist(oi);
%stem(binLocation,count);

%%%%%%Plot of original image and contrast enhanced image parllelly on
%the same figure.%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for h=1:8
   x2=images;
    x3=x2;
    x4=x3;
   imi=mat2gray(x4);

 b2=final;
I3=b2;
I2=I3;
fi=mat2gray(I2);
figure(3);
title('histogram of final image');

figure(4);
imshow(fi);
title('final image');

figure(5);

imshow(imadjust(images));
title('imadjust');
figure(6);
imhist(imadjust(images),256);
title('histogram of imadjust');
figure(7);

imshow(histeq(images));
title('histeq');
figure(8);
imhist(histeq(images),256);
title('histogram of histeq');

end

%end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%Contrast enhancement inbuilt functions in matlab %%%%%%%%%%%
for q=1:8
B1=images(1,:,:);
i1=B1(1,1);
Iq=i1;    
final_imadjust{q,:,:} = imadjust(Iq);
final_histeq{q,:,:} = histeq(Iq);
final_adapthisteq{q,:,:} = adapthisteq(Iq);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%Evaluation methods for three matlab functions%%%%%%%%%
entropy_value_imad=entropy(images,final_imadjust);
contrast_value_imad=contrast(images,final_imadjust);
mean_brightness_imad=meanbrightness(images,final_imadjust);
psnr_value_imad=psnr(images,final_imadjust);
structure_similarity_imad=structuralsimilarity(images,final_imadjust);

entropy_value_hist=entropy(images,final_histeq);
contrast_value_hist=contrast(images,final_histeq);
mean_brightness_hist=meanbrightness(images,final_histeq);
psnr_value_hist=psnr(images,final_histeq);
structure_similarity_hist=structuralsimilarity(images,final_histeq);

entropy_value_adapt=entropy(images,final_adapthisteq);
contrast_value_adapt=contrast(images,final_adapthisteq);
mean_brightness_adapt=meanbrightness(images,final_adapthisteq);
psnr_value_adapt=psnr(images,final_adapthisteq);
structure_similarity_adapt=structuralsimilarity(images,final_adapthisteq);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('-------------------------------------------------------------------------\n');
 fprintf('Algorithm        RCE      REE      RMBE      RSS   PSNR(dB)  \n');
 fprintf('-------------------------------------------------------------------------\n');
fprintf('%d               %.4f    %.4f   %.4f    %.4f   %.2f         \n',l,sum(contrast_value),      sum(entropy_value),     sum(mean_brightness),     sum(structure_similarity),     mean(psnr_value));
fprintf('imadjust         %.4f    %.4f   %.4f    %.4f   %.2f         \n'   ,sum(contrast_value_imad),sum(entropy_value_imad),sum(mean_brightness_imad),sum(structure_similarity_imad),mean(psnr_value_imad));
 fprintf(' histeq         %.4f    %.4f   %.4f    %.4f   %.2f         \n'   ,sum(contrast_value_hist),sum(entropy_value_hist),sum(mean_brightness_hist),sum(structure_similarity_hist),mean(psnr_value_hist));
 fprintf('adapthhisteq    %.4f    %.4f   %.4f    %.4f   %.2f         \n'   ,sum(contrast_value_adapt),sum(entropy_value_adapt),sum(mean_brightness_adapt),sum(structure_similarity_adapt),mean(psnr_value_adapt));
 fprintf('--------------------------------------------------------------------------\n');
 
 fprintf('\n\nRetrived data: %.2f\n\n',hide_data1);
