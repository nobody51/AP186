firstAxis = [];
secondAxis = [];

for count=1:11
    I = imread("C:\Users\ADMIN\Documents\PHYSICS\6thYear\186\AP186\186A10\cleaned\cleanPen"+string(count)+".jpg");
    [A,BB,centroid]=imblobprop(I);
    firstAxis(count)=mean(centroid(1,:));
    secondAxis(count)=mean(centroid(2,:));
end
disp('x-axis values in pixel coordinates');
disp(firstAxis);
disp('y-axis values in pixel coordinates');
disp(secondAxis);
