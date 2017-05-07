function [xit, t] = normalise(xi)
%calculate mean in x and y direction
% This normalizes the 2-D points and outputs the transformed points and
% also the transition
mu = mean(xi,2);
for i = 1:2
xi(i,:) = xi(i,:) - mu(i);
end

dis = 0;
for j=1:size(xi,2)
    dis=dis+sqrt(xi(1,j).^2+xi(2,j).^2);
end
dis = dis/size(xi,2);
zoom = sqrt(2)/dis;
xit = zoom*xi;

t = [zoom 0 zoom*-mu(1);0 zoom zoom*-mu(2);0 0 1];
end