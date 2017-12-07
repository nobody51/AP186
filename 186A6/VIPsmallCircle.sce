//convolution of VIP with a small aperature

//display the image
F = (imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A6\VIP.png"));
f=scf();
imshow(F);
isoview();

//G = (imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A6\circleAp.png"));
nx = 128;
ny = 128;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
r = sqrt((X.^2) + (Y.^2));
G = zeros(nx,ny);
G (find(r<0.2) ) = 1;

G = bool2s(G);
f=scf();
Matplot(G*255);
isoview();
xs2png(gcf(),'cirAp');

//2D FFT of VIP
F = rgb2gray(double(F));
fftF = fft2(F);
f=scf();
Matplot(imnorm(abs(fftF))*255);
isoview();
xs2png(gcf(),'fftFmat');

f=scf();
imshow(uint8(imnorm(abs(fftF))*255));
isoview();
xs2png(gcf(),'fftFim');

//fftshift of aperature
shiftG = fftshift(G);
f=scf();
Matplot(shiftG*255);
isoview();
xs2png(gcf(),'shiftG');

//convolution of VIP and aperature
newImg = fftF .* shiftG;
iNewImg = fft2(newImg);
f=scf();
//f.color_map=graycolormap(32);
Matplot(imnorm(abs(iNewImg))*255);
isoview();
xs2png(gcf(),'Hmat');

f=scf();
imshow(uint8(imnorm(abs(iNewImg))*255));
isoview();
xs2png(gcf(),'Him');

shortcut = convol2d(F,G)
f=scf();
Matplot(imnorm(abs(shortcut))*255);
isoview();
xs2png(gcf(),'HConvolmat');

f=scf();
imshow(uint8(imnorm(abs(shortcut))*255));
isoview();
xs2png(gcf(),'HConvolim');
