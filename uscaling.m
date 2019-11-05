%Uniform Scaling

function A = uscaling(s,Q)
% s is scaling factor
% Q is the fixed point 
%---------------------------------------------------------------
% Applying the formula and creating affine transformation
L = s*eye(3);
A(1:3,1:3)=L;
A(4,1:3)=(1-s)*Q;
A(1:3,4)=0;
A(4,4) = 1;
%---------------------------------------------------------------
% A is automatically returned back
%---------------------------------------------------------------
end