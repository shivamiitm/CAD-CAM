%reflection

function A = reflection(n,Q)
% n is normal vector of reflection plane
% Q is the fixed point through which the plain passes
un= n/norm(n);               %making normal vector a unit vector
%---------------------------------------------------------------
% Applying the formula 
L = eye(3)-2*un'*n;          
%---------------------------------------------------------------
% Creating Affine Transform
A(1:3,1:3)=L;
A(4,1:3)=Q*(eye(3)-L);
A(1:3,4)=0;
A(4,4) = 1;
%---------------------------------------------------------------
% A is automatically returned back
%--------------------------------------------------------------- 
end