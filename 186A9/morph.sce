//shapes
square = zeros(11,11);
square(4:8,4:8) = 1;

triangle = zeros(12,12);
triangle(7,5:8) = 1;
triangle(6,5:7) = 1;
triangle(5,5:5) = 1;

hsquare = zeros(12,12);
hsquare(2:11,2:11) = 1;
hsquare(4:9,4:9) = 0;

cross = zeros(11,11);
cross(6,4:8) = 1;
cross(4:8,6) = 1;

//structure elements
A = imcreatese('rect',2,2);
B = imcreatese('rect',2,1);
C = imcreatese('rect',1,2);

A1_dil = imerode(hsquare,B);
f=scf();
imshow(A1_dil);
isoview();
xs2png(gcf(),'lol');

