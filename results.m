fprintf('-------------------------------------------------------------------------\n');
fprintf('Algorithm        RCE      REE      RMBE      RSS   PSNR(dB)  \n');
fprintf('-------------------------------------------------------------------------\n');
load results20.mat;
fprintf('20              %.4f    %.4f   %.4f    %.4f   %.2f         \n',sum(contrast_value),      sum(entropy_value),     sum(mean_brightness),     sum(structure_similarity),     mean(psnr_value));
load results15.mat;
fprintf('15              %.4f    %.4f   %.4f    %.4f   %.2f         \n',sum(contrast_value),      sum(entropy_value),     sum(mean_brightness),     sum(structure_similarity),     mean(psnr_value));
load results10.mat;
fprintf('10              %.4f    %.4f   %.4f    %.4f   %.2f         \n',sum(contrast_value),      sum(entropy_value),     sum(mean_brightness),     sum(structure_similarity),     mean(psnr_value));

fprintf('imadjust         %.4f    %.4f   %.4f    %.4f   %.2f         \n'   ,sum(contrast_value_imad),sum(entropy_value_imad),sum(mean_brightness_imad),sum(structure_similarity_imad),mean(psnr_value_imad));
fprintf('histeq         %.4f    %.4f   %.4f    %.4f   %.2f         \n'   ,sum(contrast_value_hist),sum(entropy_value_hist),sum(mean_brightness_hist),sum(structure_similarity_hist),mean(psnr_value_hist));
fprintf('adapthhisteq    %.4f    %.4f   %.4f    %.4f   %.2f         \n'   ,sum(contrast_value_adapt),sum(entropy_value_adapt),sum(mean_brightness_adapt),sum(structure_similarity_adapt),mean(psnr_value_adapt));
fprintf('--------------------------------------------------------------------------\n');
