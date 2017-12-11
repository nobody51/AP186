A = imread('C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A4\icelandaratio.png');
A = rgb2gray(A);
//figure(0);
//imshow(A);

// takes the edge of the picture
E = bool2s(edge(A,'prewitt'));
imageE = uint8(E)*255;
imwrite(imageE,'icelandborder.png');

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


disp(Area);
f = scf();
plot(xSorted,ySorted,'r-');
isoview();
xs2png(gcf(),'icelandArea.png');
