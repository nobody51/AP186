nx = 500;
ny = 500;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
A = zeros (nx,ny);
A (find(abs(X)<0.3 & abs(Y)<0.3) ) = 1;

f=scf();
Matplot(255*uint8(A));
isoview();
xs2png(gcf(),'A');

AFT = fft2(A);
normAFT = imnorm(abs(AFT));

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
