% Non-uniform Scaling

function A = nuscaling(s,n,Q)

% s is scaling factor
% Q is the fixed point
% n is the direction in which scaling is done
un= n/norm(n);              % making normal vector a unit vector
%---------------------------------------------------------------
% Applying the formula and creating affine transformation
L = eye(3)+(s-1)*(un'*un);
A(1:3,1:3)=L;
A(4,1:3)=(1-s)*Q*(un'*un);
A(1:3,4)=0;
A(4,4) = 1;
%---------------------------------------------------------------
% A is automatically returned back
%---------------------------------------------------------------
end