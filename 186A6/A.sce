//same steps as start.sce but with the 'A' image
A = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A6\A.png");
A = rgb2gray(A);

//1
f=scf();
imshow(A);
isoview();
xs2png(gcf(),'A');

//2
A = double(A);
AFT = fft2(A);
normAFT = imnorm(abs(AFT));
f=scf();
Matplot(normAFT*255);
isoview();
xs2png(gcf(),'AFTmatplot');

f=scf();
imshow(uint8(normAFT*255));
isoview();
xs2png(gcf(),'AFTimshow');

//3
//fftshift using matplot
f=scf();
Matplot(fftshift(normAFT)*255);
isoview();
xs2png(gcf(),'AFTshiftmatplot');

f=scf();
imshow(fftshift(uint8(normAFT*255)));
isoview();
xs2png(gcf(),'AFTshiftimshow');

//5
iAFT = fft2(AFT);
f=scf();
Matplot(iAFT);
isoview();
xs2png(gcf(),'iAFT');

//7
//real part
f=scf();
Matplot(real(AFT)*255);
isoview();
xs2png(gcf(),'AFTrealmatplot');

f=scf();
imshow(uint8(real(AFT)*255));
isoview();
xs2png(gcf(),'AFTrealimshow');

//imag part
f=scf();
Matplot(imag(AFT)*255);
isoview();
xs2png(gcf(),'AFTimagmatplot');

f=scf();
imshow(uint8(imag(AFT)*255));
isoview();
xs2png(gcf(),'AFTimagimshow');



