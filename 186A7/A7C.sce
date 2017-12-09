//7C
nx = 200;ny = 200;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);

//1
dots = zeros(nx, ny);dots(100,75) = 1;dots(100,125) = 1;
FT_dots = abs(fftshift(fft2((dots))));
f=scf();imshow(dots);isoview();xs2png(gcf(),'dots');
f=scf();imshow(uint8(FT_dots)*255);isoview();xs2png(gcf(),'dotsFT');

//1
r1 = sqrt(((X).^2) + ((Y+0.25).^2));
r2 = sqrt(((X).^2) + ((Y-0.25).^2));
A = zeros(nx,ny);
A (find(r1<0.1) ) = 1;
A (find(r2<0.1) ) = 1;

AFT = imnorm(abs(fft2(A)))

f=scf();imshow(A);isoview();xs2png(gcf(),'circles');
f=scf();imshow(uint8(fftshift(AFT)*255));isoview();xs2png(gcf(),'circlesFT');

//3
squares = zeros (nx,ny);squares (find(abs(X)< 0.02 & abs(Y)>0.23 & abs(Y)<0.27) ) = 1;
FT_squares = abs(fftshift(fft2(double(squares))));
f=scf();imshow(squares);isoview();xs2png(gcf(),'squares');
f=scf();imshow(FT_squares);isoview();xs2png(gcf(),'squaresFT');

//4/5
a = 1
b = 0.5
c = 0.1
rx = a*exp(-(X).^2/(2*c^2));
ry1 = a*exp(-(Y-b).^2/(2*c^2));
ry2 = a*exp(-(Y+b).^2/(2*c^2));
gauss = rx.*ry1 + rx.*ry2
FT_gauss =imnorm(abs(fftshift(fft2(double(gauss)))))

f=scf();imshow(gauss);isoview();xs2png(gcf(),'gauss');
f=scf();imshow(uint8(FT_gauss*255));isoview();xs2png(gcf(),'gaussFT');

//6
randA = zeros(nx,ny);
randA(rand(1,1) * 100,rand(1,1)*100) = 1;
randA(rand(1,1) * 100,rand(1,1)*100) = 1;
randA(rand(1,1) * 100,rand(1,1)*100) = 1;
randA(rand(1,1) * 100,rand(1,1)*100) = 1;
randA(rand(1,1) * 100,rand(1,1)*100) = 1;
randA(rand(1,1) * 100,rand(1,1)*100) = 1;
randA(rand(1,1) * 100,rand(1,1)*100) = 1;
randA(rand(1,1) * 100,rand(1,1)*100) = 1;
randA(rand(1,1) * 100,rand(1,1)*100) = 1;
randA(rand(1,1) * 100,rand(1,1)*100) = 1;
f=scf();
imshow(randA);
isoview();
xs2png(gcf(),'random');

mx = 9;my = 9;
a = linspace(-1,1,mx);
b = linspace(-1,1,my);
[A,B] = ndgrid(a,b);

test = zeros (mx,my);
r = sqrt(A.^2 + B.^2);
test (find(r < 0.5)) = 1;
f=scf();imshow(test);isoview();xs2png(gcf(),'shape');

redux = convol2d(randA,test);
f=scf();imshow(redux);isoview();xs2png(gcf(),'randomXshape');

//7
board = zeros(nx,ny);
step = 10
for i = 1:step:nx+1
    for j = 1:step:ny+1
        board(i, j) = 1;
    end
end

boardFT = imnorm(abs(fftshift(fft2(double(board)))));
f=scf();imshow(board);isoview();xs2png(gcf(),'board10');
f=scf();imshow(boardFT);isoview();xs2png(gcf(),'board10FT');
  
