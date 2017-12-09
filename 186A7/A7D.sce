finger = imread('C:\Users\Anton Cruz\Desktop\186\AP186\186A7\7D\print.jpg');
finger = double(finger);
grayfinger = mat2gray(finger(:,:,1));

f=scf();
imshow(grayfinger);
isoview();
xs2png(gcf(),'grayfinger');

fingerFT = fft2(grayfinger);

f=scf();
imshow(imnorm(log(abs(fftshift(fingerFT)))));
isoview();xs2png(gcf(),'grayfingerFT');

nx = 481;ny = 448;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
r = sqrt(X.^2 + Y.^2)
A = zeros(nx,ny);
A (find(r<0.28 & r > 0.17)) = 1;
B = zeros(nx,ny);
B (find(r<0.01)) = 1;
D = exp(-(X.^2 + Y.^2));
D (find(r>0.28) ) = 0;
mask = A + B
mask = mask .* D
mask = double(mask)
f=scf();
imshow(mask);
isoview();
xs2png(gcf(),'mask');

imageFT = fftshift(fingerFT).*mask

image = mat2gray(abs(ifft(imageFT)));
f=scf();
imshow(image>0.6);
isoview();
xs2png(gcf(),'testimage0.4');