input_img = imread('1.jpg')
imshow(input_img)





imwrite(input_img, 'E:\terme 9\DC\Projects\1\matlab\level4\a.jpg')
imwrite(input_img, 'E:\terme 9\DC\Projects\1\matlab\level4\b.png')
imwrite(input_img, 'E:\terme 9\DC\Projects\1\matlab\level4\c.bmp')
imwrite(input_img, 'E:\terme 9\DC\Projects\1\matlab\level4\d.jpeg')
imwrite(input_img, 'E:\terme 9\DC\Projects\1\matlab\level4\e.tif')
imwrite(input_img, 'E:\terme 9\DC\Projects\1\matlab\level4\f.hdf')



gray_img = rgb2gray(input_img);
figure
imshow(gray_img)

noisy_img = imnoise(gray_img, 'gaussian')
figure
imshow(noisy_img)
title('Portion of the Image with Added Gaussian Noise');

img=input_img;
img=double(img(:));
ima=max(img(:));
imi=min(img(:));
mse=std(img(:));
before_snr=20*log10((ima-imi)./mse)

img=noisy_img;
img=double(img(:));
ima=max(img(:));
imi=min(img(:));
mse=std(img(:));
after_snr=20*log10((ima-imi)./mse)

ft=fftshift(log(abs(fft2(gray_img))));
figure
imshow(ft, []);

removed_noise_img1=wiener2(noisy_img,[5 5]);
figure
imshow(removed_noise_img1)
title('removed noise image1')

removed_noise_img2=medfilt2(noisy_img, [3 3]);
figure
imshow(removed_noise_img2)
title('removed noise image2')


peaksnr1=psnr(removed_noise_img1, noisy_img)

peaksnr2=psnr(removed_noise_img2, noisy_img)

energy = sum(gray_img, 'all')
