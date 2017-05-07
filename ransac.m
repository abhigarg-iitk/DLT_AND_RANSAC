function [tform] = ransac(xi, xip, N, dis, Threshold)
%Implementation of RANSAC algorithm
len = size(xi, 2);
%xi = xi([2 1],:);
%xip = xip([2 1],:);
inlier_max = 0;
h_min  = ones(3,3);
for n = 1:N
    rand = randperm(len);
    index = rand(1:4);
    h = DirectLinearTransformation(xi(:,index),xip(:,index));
    error = 0;
    tform = projective2d(h');
    forward = transformPointsForward(tform,xi');
    backward = transformPointsInverse(tform,xip');
    inlier = (((forward(:,1)-xip(1,:)').^2 + (forward(:,2)-xip(2,:)').^2 + (backward(:,1)-xi(1,:)').^2 +(backward(:,2)-xi(2,:)').^2)< dis);
    if inlier_max < sum(inlier)
        h_min = h;
        inlier_max = sum(inlier);
        if inlier_max > Threshold
            break
        end
    end
end
tform = projective2d(h_min');
forward = transformPointsForward(tform,xi');
backward = transformPointsInverse(tform,xip');
inlier = (((forward(:,1)-xip(1,:)').^2 + (forward(:,2)-xip(2,:)').^2 + (backward(:,1)-xi(1,:)').^2 +(backward(:,2)-xi(2,:)').^2)< dis);
size(xi(:,inlier))
h = DirectLinearTransformation(xi(:,inlier),xip(:,inlier));
tform = projective2d(h');

end