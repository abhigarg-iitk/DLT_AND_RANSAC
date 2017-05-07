function [] = DLT(xi, xip, img)
%This is a driver program that drives and runs the code
h = DirectLinearTransformation(xi, xip);
imga = imread(img);
figure
imshow(imga)
figure
tform = projective2d(h');
imshow(imwarp(imga,tform))
end