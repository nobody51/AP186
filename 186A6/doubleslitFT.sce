nx = 200;ny = 200;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);

dots = zeros(nx, ny);dots(100,95) = 1;dots(100,105) = 1;
FT_dots = abs(fftshift(fft2((dots))));
f=scf();imshow(dots);isoview();xs2png(gcf(),'A')
f=scf();imshow(uint8(FT_dots)*255);isoview();xs2png(gcf(),'AFT')
