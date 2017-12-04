nx = 50;
ny = 50;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
A = zeros (nx,ny);
A (find(abs(X)<0.7 & abs(Y)<0.7) ) = 1;
//E = edge(A,'canny')
//imshow(E);

A = double(A);
fftA = fft2(A);
fftA = uint8(imnorm(fftshift(abs(fftA)))*255);
f=scf();
imshow(fftA);

//f = scf();
//grayplot(x,y,A);
//f.color_map = graycolormap(32);
//xs2png(gcf(),'centeredSquare.png');
//
//
