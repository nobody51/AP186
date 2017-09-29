A = imread("C:\Users\up csrc\Documents\186A6\smallA.png");
A = rgb2gray(double(A));

B = imread("C:\Users\up csrc\Documents\186A6\phrase.png");
B = rgb2gray(double(B));

//get FT of A & B
ftA = fft2(A);
ftB = fft2(B);

//correlation; denoted by P in frequency space
ftP = conj(ftB).*ftA
P = fftshift(fft2(ftP));
//takes the lowest value and makes it 0
P = abs(P) - min(abs(P(:)));
//imshow wont work since there are values greater than 255;
//thus the need for line 15
P = P.^2
//dots become more noticable (edit the power)

f=scf();
imshow(uint8(imnorm(P)*255));
//white dots indicate the letters that are the same
isoview();

