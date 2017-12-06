N = 128;
x = linspace(-1,1,N);
[X,Y] = meshgrid(x);
r = sqrt(X.^2 + Y.^2);
circle = zeros(size(X,1), size(X,2));
circle(find (r <=0.8)) = 1.0;

//1
f=scf();
Matplot(255*uint8(circle));
isoview();
xs2png(gcf(),'circle');

2
CFT = fft2(circle);
//takes the absoulte value of the FT, then normalizes
normCFT = imnorm(abs(CFT));

//FT using matplot
f=scf();
Matplot(normCFT*255);
isoview();
xs2png(gcf(),'circleFTmatplot');
//FT using imshow
f=scf();
imshow(uint8(abs(CFT)));
isoview();
xs2png(gcf(),'circleFTimshow');

//3
//fftshift using matplot
f=scf();
Matplot(fftshift(normCFT)*255);
isoview();
xs2png(gcf(),'circleFTshiftmatplot');
//fftshift using imshow
f=scf();
imshow(uint8(fftshift(abs(CFT))));
isoview();
xs2png(gcf(),'circleFTshiftimshow');

//5
CFT2 = fft2(CFT);
f=scf();
Matplot(CFT2);
isoview();
xs2png(gcf(),'circleIFT');

//7
//real part matplot
f=scf();
Matplot(real(CFT)*255);
isoview();
xs2png(gcf(),'circleFTmatplotReal');
//imshow
f=scf();
imshow(uint8(real(CFT)));
isoview();
xs2png(gcf(),'circleFTimshowReal');

//imag part matplot
f=scf();
Matplot(imag(CFT)*255);
isoview();
xs2png(gcf(),'circleFTmatplotImag');
//imshow
f=scf();
imshow(uint8(imag(CFT)));
isoview();
xs2png(gcf(),'circleFTimshowImag');
