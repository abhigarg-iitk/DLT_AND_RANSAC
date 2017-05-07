function h = DirectLinearTransformation(xi,xip)
%% Given xi and xip this code outputs h s.t. xip = h*xi
% Convert to homogeneous coordinates.
%We normalize points s.t. their mean is at origin and S.D. in 1/root(2).
[xi ti]= normalise(xi);
[xip tip]= normalise(xip);
%We convert points into homogenous coordinates
xi = [xi ; ones(1,size(xi,2))];
xip = [xip ; ones(1,size(xip,2))];

a = [];
for i=1:size(xi,2)
    a = [a; zeros(1,3)     (-1).*xi(:,i)'   xip(2,i).*xi(:,i)'; xi(:,i)'   zeros(1,3)     (-xip(1,i))*xi(:,i)'];
end

%DO the SVD and then pick the last column
[a,b,c] = svd(a);

h = inv(tip)*reshape(c(:,9),3,3)'*ti;