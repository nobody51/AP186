N = 128;
x = linspace(-1,1,N);
[X,Y] = meshgrid(x);
r = sqrt(X.^2 + Y.^2);
circle = zeros(size(X,1), size(X,2));
circle(find (r <=0.5)) = 1.0;

//1
f=scf();
Matplot(255*circle);
isoview();

2
CFT = fft2(circle);
//takes the absoulte value of the FT, then normalizes
normCFT = imnorm(abs(CFT));
//FT using matplot
f=scf();
Matplot(normCF2T*255);
isoview();
//FT using imshow
f=scf();
imshow(uint8(abs(CFT)));
isoview();

//3
//fftshift using matplot
f=scf();
Matplot(fftshift(normCFT)*255);
isoview();
//fftshift using imshow
f=scf();
imshow(uint8(fftshift(abs(CFT))));
isoview();

//5
CFT2 = fft2(CFT);
f=scf();
Matplot(CFT2);
isoview();

//7
//whole
f=scf();
Matplot(abs(CFT)*255);
isoview();
//real part
f=scf();
Matplot(real(CFT)*255);
isoview();

//imag part
f=scf();
Matplot(imag(CFT)*255);
isoview();

