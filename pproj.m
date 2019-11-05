% Perspective projection

function A = pproj(n, E, Q)

% n is normal of plane on which projection is made
% Q is the fixed point 
% E is the eye point
un = n/norm(n);             % making normal vector a unit vector
%---------------------------------------------------------------
% Applying the formula
L = dot((E-Q),un)*eye(3)-un'*E;
%---------------------------------------------------------------
% Creating affine transformation
A(1:3,1:3)=L;
A(4,1:3)=dot(Q,un)*E;
A(1:3,4)=-un';
A(4,4) = dot(E,un);
%---------------------------------------------------------------
% A is automatically returned back
%---------------------------------------------------------------
end