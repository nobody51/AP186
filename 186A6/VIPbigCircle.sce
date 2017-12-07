//convolution

//display the image
F = (imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A6\VIP.png"));
f=scf();
imshow(F);
isoview();

G = (imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A6\circleAp2.png"));
G = bool2s(G);
f=scf();
Matplot(G*255);
isoview();

//2D FFT of VIP
F = rgb2gray(double(F));
fftF = fft2(F);
f=scf();
Matplot(imnorm(abs(fftF))*255);
isoview();

f=scf();
imshow(uint8(imnorm(abs(fftF))*255));
isoview();

//fftshift of aperature
shiftG = fftshift(G);
f=scf();
Matplot(shiftG*255);
isoview();

//convolution of VIP and aperature
newImg = fftF .* shiftG;
iNewImg = fft2(newImg);
f=scf();
Matplot(imnorm(abs(iNewImg))*255);
isoview();

f=scf();
imshow(uint8(imnorm(abs(iNewImg))*255));
isoview();

//this way is FAIL
shortcut = convol2d(F,G)
f=scf();
Matplot(imnorm(abs(shortcut))*255);
isoview();

f=scf();
imshow(uint8(imnorm(abs(shortcut))*255));
isoview();
