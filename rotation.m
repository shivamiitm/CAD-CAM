%rotation

function A = rotation(th, n, Q)
% n is axis of rotation
% Q is the fixed point through which the axis of rotation passes
% th is the angle by which point is rotated
un= n/norm(n);                 % making normal vector a unit 
                               % vector
%---------------------------------------------------------------
% Applying the formula 
t1=cos(th)*eye(3);             % first term
t2=(1-cos(th))*(un'*un);       % second term
t3=sin(th)*[0,un(3),-un(2);-un(3),0,un(1);un(2),-un(1),0];  
                               % third term
t = t1+t2+t3;                  % sum all terms to get 'La'
%---------------------------------------------------------------
% Creating Affine Transform
A(1:3,1:3)=t;                  % placing 'La' in top left 
                               % of Affine transformation matrix
A(4,1:3)=Q*(eye(3)-t);         % placing 'w' in bottom left 
                               % of Affine transformation matrix
A(1:3,4)=0;                    % placing '0' in top right 
                               % of Affine transformation matrix
A(4,4) = 1;                    % placing '1' in bottom right 
                               % of Affine transformation matrix
%---------------------------------------------------------------
% A is automatically returned back
%---------------------------------------------------------------
end
