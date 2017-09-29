//same steps as start.sce but with the 'A' image
A = imread("C:\Users\up csrc\Documents\186A6\A.png");
A = rgb2gray(A);

//1
f=scf();
imshow(A);
isoview();

//2
A = double(A);
AFT = fft2(A);
normAFT = imnorm(abs(AFT));
f=scf();
Matplot(normAFT*255);
isoview();

//3
//fftshift using matplot
f=scf();
Matplot(fftshift(normAFT)*255);
isoview();

//5
iAFT = fft2(AFT);
f=scf();
Matplot(iAFT);
isoview();

//7
//whole
f=scf();
Matplot(abs(AFT)*255);
isoview();
//real part
f=scf();
Matplot(real(AFT)*255);
isoview();

//imag part
f=scf();
Matplot(imag(AFT)*255);
isoview();


