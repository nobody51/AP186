nx = 50;
ny = 50;
x = linspace(-1,1,nx);
y = linspace(-1,1,ny);
[X,Y] = ndgrid(x,y);
r = sqrt(2*(X.^2) + (Y.^2)/2);
A = zeros(nx,ny);
A (find(r<0.7) ) = 1;
f = scf();
imshow(uint8(A*255));isoview();
xs2png(gcf(),'ellipse.png');

// takes the edge of the picture
E = bool2s(edge(A,'prewitt'));
imageE = uint8(E)*255;
f = scf();
imshow(imageE);isoview();
xs2png(gcf(),'ellipsePrewitt.png');

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
disp(sum(A));
percent = (abs(sum(A)-Area)/sum(A))*100
disp(100 - percent)
//disp(length(ySorted));


f = scf();
plot(xSorted,ySorted,'r-');
isoview();

