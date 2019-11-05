%---------------------------------------------------
% Matlab code written by:
% Shivam Agarwal
% Dual Degree Student
% Mechanical Engineering Department
% Indian Institute of Technology Madras
% Chennai, India, 600036
%---------------------------------------------------
% This program displayes linear transformations of a cuboid.
% Rotation, translation, reflection, uniform scaling,
% non-uniform scaling, orthographic/oblique/perspective projections
% are the functionalities available in this program.
%---------------------------------------------------
clc;
clear;
%---------------------------------------------------
% user inputs:
%-------------------
% rotation
q_rot = [-2,-2,-2];  % point through which a fixed axis passes
N_rot = [0,1,0];     % axis vector
th = pi/3;           % angle of rotation 
%-------------------
% translation
p_tra = [1.5,2,3.5,1];   % Initial point
q_tra = [-2,-2,-2];      % Final point
%-------------------
% reflection
N_ref = [0,1,0];     % normal of the mirror
q_ref = [0,0,0];     % position of plane
%-------------------
% scaling
s_usca = 1.6;        % factor of scaling
q_usca = [1,2,3];    % fixed point
%-------------------
% non uniform scaling
s_nusca = 1.6;        % factor of scaling in a direction
N_nusca = [0,1,0];    % direction of non uniform scaling
q_nusca = [-2,-2,-2]; % fixed point
%-------------------
% orthographic projection
N_orth = [0.5,1,0.5];     % normal of plane on which projection is made
q_orth = [0,0,0];         % Q is the fixed point on the plane
%-------------------
% oblique projection
N_ob = [0,1,0];       % normal of plane on which projection is made
q_ob = [0,0,0];       % Q is the fixed point on the plane                   
w = [-1,-0.5,-0.5];   % Direction of oblique projection
%-------------------
% perspective projection
N_pers = [0,1,0];     % normal of plane on which projection is made
q_pers = [0,0,0];  % Q is the fixed point on the plane  
E = [0,-30,0];        % eye point
%-------------------
% for plotting inputs go down
%---------------------------------------------------
% derived entities
d = p_tra(1:3)-q_tra;        % position vector
%---------------------------------------------------
Ar = rotation(th, N_rot/norm(N_rot), q_rot);  % Rotation 
At = translation(d);                          % Translation
Aref = reflection(N_ref/norm(N_ref), q_ref);  % Reflection
Aus = uscaling(s_usca,q_usca);                % Uniform Scaling
Anus = nuscaling(s_nusca,N_nusca/norm(N_nusca),q_nusca);
                                              %  Non-uniform Scaling
Aop = oproj(N_orth/norm(N_orth),q_orth);      % Orthoprojections
Aobp = obproj(N_ob/norm(N_ob),w,q_ob);        % Oblique Projections
App = pproj(N_pers/norm(N_pers),E,q_pers);    % Perspective Projections

%---------------------------------------------------
% Plotting inputs  :
%-------------------
% shape and position of cuboid:
origin = [1,2,3];   % position of cuboid
x_length = 2;       % length of cuboid in x direction
y_length = 3;       % length of cuboid in y direction
z_length = 4;       % length of cuboid in z direction
% final transformation matrix
Afinal = App;        % Affine transformation matrices
        % you can either do a single transformation or a compound
        % transformation.
        % Suppose you want to rotate and then translate the cuboid, then
        % Afinal will be At*Ar. On the other hand, if you 
        % want to translate and then rotate, then Afinal
        % will be Ar*At
        % You can play with other combinations as well.
%---------------------------------------------------
plotobject(Afinal,origin, x_length,y_length,z_length);
disp(Afinal);
%---------------------------------------------------
% display:
% Grey cuboid is original cuboid
% black cuboid is transformed cuboid

%------------------------end------------------------
