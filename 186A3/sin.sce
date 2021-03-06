nx = 500; ny = 500;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
A = sin(9*X);
f = scf();
grayplot(x,y,A);
f.color_map = graycolormap(32);
A = double(A);
fftA = fft2(A);
fftA = uint8(imnorm(fftshift(abs(fftA)))*255);
f=scf();
imshow(fftA);

//xs2png(gcf(),'sine.png');
