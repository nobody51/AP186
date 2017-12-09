lunar = imread('C:\Users\Anton Cruz\Desktop\186\AP186\186A7\7F\canvas.JPG');
lunar = double(lunar);
graylunar = mat2gray(lunar(:,:,1));

f=scf();
imshow(graylunar);
isoview();
xs2png(gcf(),'graylunar');

lunarFT = fft2(graylunar);

f=scf();
imshow(imnorm(log(abs(fftshift(lunarFT)))));
isoview();
xs2png(gcf(),'graylunarFT');

mask = imread('C:\Users\Anton Cruz\Desktop\186\AP186\186A7\7f\filter.png');
mask = double(mask)
imageFT = fftshift(lunarFT).*mask

image = mat2gray(abs(ifft(imageFT)));

f=scf();
imshow(image);
isoview();
xs2png(gcf(),'graylunarFixed');
