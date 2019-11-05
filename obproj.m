% Oblique projections

function A = obproj(n, w, Q)
% n is normal of plane on which projection is made
% Q is the fixed point
uw = w/norm(w);          % making direction vector a unit vector
un = n/norm(n);          % making normal vector a unit vector
%---------------------------------------------------------------
% Applying the formula
L = eye(3)+(un'*uw)/abs(dot(un,uw));
%---------------------------------------------------------------
% Creating affine transformation
A(1:3,1:3)=L;
A(4,1:3)=Q*(eye(3)-L);
A(1:3,4)=0;
A(4,4) = 1;
disp(A);
%---------------------------------------------------------------
% A is automatically returned back
%---------------------------------------------------------------
end