A = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A9\application\cleaned\C1.png");
B = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A9\application\cleaned\C2.png");
C = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A9\application\cleaned\C3.png");
D = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A9\application\cleaned\C4.png");
E = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A9\application\cleaned\C5.png");
F = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A9\application\cleaned\C6.png");
G = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A9\application\cleaned\C7.png");
H = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A9\application\cleaned\C8.png");
I = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A9\application\cleaned\C9.png");
J = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A9\application\cleaned\C10.png");
K = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A9\application\cleaned\C11.png");
L = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A9\application\cleaned\C12.png");
//

[C1,n1] = imlabel(A);
[C2,n2] = imlabel(B);
[C3,n3] = imlabel(C);
[C4,n4] = imlabel(D);
[C5,n5] = imlabel(E);
[C6,n6] = imlabel(F);
[C7,n7] = imlabel(G);
[C8,n8] = imlabel(H);
[C9,n9] = imlabel(I);
[C10,n10] = imlabel(J);
[C11,n11] = imlabel(K);
[C12,n12] = imlabel(L);

[area1,tras1,trash1] = imblobprop(C1);
[area2,tras2,trash2] = imblobprop(C2);
[area3,tras3,trash3] = imblobprop(C3);
[area4,tras4,trash4] = imblobprop(C4);
[area5,tras5,trash5] = imblobprop(C5);
[area6,tras6,trash6] = imblobprop(C6);
[area7,tras7,trash7] = imblobprop(C7);
[area8,tras8,trash8] = imblobprop(C8);
[area9,tras9,trash9] = imblobprop(C9);
[area10,tras10,trash10] = imblobprop(C10);
[area11,tras11,trash11] = imblobprop(C11);
[area12,tras12,trash12] = imblobprop(C12);

area = cat(2,area1,area2,area3,area4,area5,area6,area7,area8,area9,area10,area11,area12)
n = n1+n2+n3+n4+n5+n6+n7+n8+n9+n10+n11+n12

area (find(area<400)) = %nan;
area(find(area>600)) = %nan;

//[cf, ind] = histc(n1,area1);
histplot(n,area);
//xs2png(gcf(),'histArea');

avg = nanmean(area);
std = nanstdev(area);
disp(avg);disp(std);


