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

mask = imread('C:\Users\Anton Cruz\Desktop\186\AP186\186A7\7F\rfilter.png');
mask = double(mask)

image = imnorm(abs(fftshift(fft2(mask))));

f=scf();
imshow(uint8(image*255));
isoview();
xs2png(gcf(),'graylunarFixedAlt');
