//convolution

//display the image
F = (imread("C:\Users\up csrc\Documents\186A6\VIP.png"));
//f=scf();
//imshow(F);
//isoview();

G = (imread("C:\Users\up csrc\Documents\186A6\circleAp2.png"));
G = bool2s(G);
//f=scf();
//Matplot(G*255);
//isoview();

//2D FFT of VIP
F = rgb2gray(double(F));
fftF = fft2(F);
//f=scf();
//Matplot(imnorm(abs(fftF))*255);
//isoview();

//fftshift of aperature
shiftG = fftshift(G);
//f=scf();
//Matplot(shiftG*255);
//isoview();

//convolution of VIP and aperature
newImg = fftF .* shiftG;
iNewImg = fft2(newImg);
f=scf();
//f.color_map=graycolormap(32);
Matplot(imnorm(abs(iNewImg))*255);
isoview();

//this way is FAIL
shortcut = convol2d(F,G)
f=scf();
Matplot(imnorm(abs(shortcut))*255);
isoview();
