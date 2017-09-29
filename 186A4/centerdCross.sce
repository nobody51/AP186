nx = 50;
ny = 50;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
A = zeros (nx,ny);
B = zeros (nx,ny);
A (find(abs(X)<0.25 &abs(X)>0.1 & Y>0 & Y<0.25) ) = 1; //transcept
B (find(abs(X)<0.1 & abs(Y)<0.4) ) = 1; //nave
C = A + B;

// takes the edge of the picture
E = bool2s(edge(C,'prewitt'));
imageE = uint8(E)*255;

// finds the center and converts the image coors to cartesian coors
[yEdge,xEdge] = find(E);
xCenter = mean(xEdge);
yCenter = mean(yEdge);

xCentered = xEdge-xCenter;
yCentered = yEdge-yCenter;

//takes theta basis and sorts the angles, then uses that "sort" to sort the cart.coor. plot
rCoor = sqrt(xCentered^2 + yCentered^2);
thetaCoor = atan(yCentered,xCentered);
[orderedTheta, k] = gsort(thetaCoor, "g", "i");
xSorted = xCentered(k)';
ySorted = yCentered(k)';

// greens theorem
xDy = sum((xSorted(1:size(xSorted,1)-1) .* ySorted(2:size(ySorted,1))));
yDx = sum((ySorted(1:size(xSorted,1)-1).* xSorted(2:size(ySorted,1))));
Area = 0.5 * (xDy-yDx)

//Area = xDy - yDx;
disp(Area);
//disp(length(ySorted));

f = scf();
plot(xSorted,ySorted,'r-');
isoview();
xs2png(gcf(),'prewittcross50.png');
