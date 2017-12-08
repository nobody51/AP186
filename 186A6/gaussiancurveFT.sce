nx = 100; ny = 100;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
a = 1
b = 0.5
c = 0.2
rx = a*exp(-(X-b).^2/(2*c^2));
ry = a*exp(-(Y-b).^2/(2*c^2));
A = rx.*ry
f = scf();
grayplot(x,y,A);
f.color_map = graycolormap(32)
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
