A = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A6\correlation\A.png");
A = rgb2gray(double(A));

B = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A6\correlation\phrase.png");
B = rgb2gray(double(B));

//get FT of A & B
ftA = fft2(A);
f=scf();
imshow(fftshift(uint8(imnorm(abs(ftA))*255)));
isoview();

ftB = fft2(B);
f=scf();
imshow(fftshift(uint8(imnorm(abs(ftB))*255)));
isoview();

//correlation; denoted by P in frequency space
ftP = conj(ftB).*ftA
f=scf();
imshow(fftshift(uint8(imnorm(abs(ftP))*255)));
isoview();

P = fftshift(fft2(ftP));
//takes the lowest value and makes it 0
P = abs(P) - min(abs(P(:)));
//imshow wont work since there are values greater than 255;
//thus the need for line P = abs(P)...
P = P.^2
//dots become more noticable (edit the power)

f=scf();
imshow(uint8(imnorm(P)*255));
//white dots indicate the letters that are the same
isoview();

