nx = 500; ny = 500;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);

freq = 8;
z = sin(2*%pi*freq*Y);
FT_z = imnorm(abs(fftshift(fft2(z))));
f = scf();imshow(z);isoview;xs2png(gcf(),'A')
f = scf();Matplot((FT_z)*255);isoview;xs2png(gcf(),'AFTmat')
f = scf();imshow(uint8(FT_z*255));isoview();xs2png(gcf(),'AFTim')
