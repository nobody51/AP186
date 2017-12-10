I = imread("C:\Users\Anton Cruz\Desktop\186\AP186\186A9\application\binarized\C12.png");

SE1 = imcreatese('ellipse',10,10);
SE2 = imcreatese('ellipse',4,4);


im1 = imclose(I,SE1);
im2 = imopen(I,SE2);
im3 = imclose(im2,SE2);

f=scf();
imshow(I);
isoview();
//xs2png(gcf(),'C2');

f=scf();
imshow(im2);
isoview();
xs2png(gcf(),'C12');
