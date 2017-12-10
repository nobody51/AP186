A = imread("C:\Users\Anton Cruz\Desktop\186\AP186\186A9\application\cleaned\C1.png");

[Clabel,n] = imlabel(I);

[area, trash, trash1] = imblobprop(Clabel);

[cf, ind] = histc(n,area);
histplot(n,area);
xs2png(gcf(),'histArea');


