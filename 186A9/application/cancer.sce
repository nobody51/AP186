I = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A9\application\segmented\cancer.jpg");

//[count, cells] = imhist(I, 256);
//plot (cells,count);

//f=scf();
BW = I>215;
avg = 513.59184;
std = 36.72642;
area = avg+std;
r = sqrt(area/%pi);
disp(r);
SE2 = imcreatese('ellipse',5,5);
SE1 = imcreatese('ellipse',20,20);

im2 = imclose(BW,SE2);
im22 = imopen(im2,SE2)
//[C1,n1] = imlabel(im2);
//
//[area1,tras1,trash1] = imblobprop(C1);

im3 = imopen(im22,SE1);
f=scf();
imshow(im22);
f=scf();
imshow(im3);
//xs2png(gcf(),'cancerCells');


