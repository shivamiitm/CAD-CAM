function plotobject(A, origin, x_length,y_length,z_length)


 
 f = face(); e = edge(); v = vertex(origin, x_length,y_length,z_length); 
 
  hold on;
  %-----------------------------------------------------------
  % Plotting original cube
  
     for fn =1:6
         for en = 1:4
             c1 = v(e(f(fn,en),1),:);
             c2 = v(e(f(fn,en),2),:);
             t = 0:0.01:1;
             X = t*(c2(1)-c1(1))+c1(1);
             Y = t*(c2(2)-c1(2))+c1(2);
             Z = t*(c2(3)-c1(3))+c1(3);
             plot3(X,Y,Z,'color',[0.5 0.5 0.5],'linewidth',2);          
         end
     end
 %------------------------------------------------------------
 % taking linear transformation of all the vertices
 
 sv = size(v);
 vn = zeros(sv);
 for i = 1: sv(1)
     P(1:3) = v(i,:);
     P(4)= 1;
     Pn = P*A;
     Pn = Pn/Pn(4);
     vn(i,1:3) = Pn(1:3);
 end
 %------------------------------------------------------------
 % plotting transformed cube
 
     for fn =1:6
         for en = 1:4
             c1 = vn(e(f(fn,en),1),:);
             c2 = vn(e(f(fn,en),2),:);
             t = 0:0.01:1;
             X = t*(c2(1)-c1(1))+c1(1);
             Y = t*(c2(2)-c1(2))+c1(2);
             Z = t*(c2(3)-c1(3))+c1(3);
             plot3(X,Y,Z,'color',[0 0 0],'linewidth',2);          
         end
     end
 %------------------------------------------------------------ 
 % setting the plot and views
 
 hold off;
 axis tight;
 % axis([0 5 0 5 0 5]);
 axis equal;
 xlabel('x axis','FontSize',12,'FontWeight','bold');
 ylabel('y axis','FontSize',12,'FontWeight','bold');
 zlabel('z axis','FontSize',12,'FontWeight','bold');
%   view(270,0); %side view
%  view(0,0); %front view
%  view(0,90); %top view
  view(-45,35.264); %isometric view
 %-----------------------------------------------------------
end


%------------------------------------------------------------
% Storage of data:
%------------------------------------------------------------


function f = face()              % provide face name and choice of edge
                                 % and get edge name
    f(1,1:4) = [1,2,3,4];
    f(2,1:4) = [12,4,11,8];
    f(3,1:4) = [5,8,7,6];
    f(4,1:4) = [9,6,10,2];
    f(5,1:4) = [1,9,5,12];
    f(6,1:4) = [3,10,7,11];
end

function e = edge()              % provide edge name and choice of vertex
                                 % and get vertex name
    e(1,1:2) = [1,2];
    e(2,1:2) = [4,1];
    e(3,1:2) = [3,4];
    e(4,1:2) = [2,3];
    e(5,1:2) = [6,5];
    e(6,1:2) = [5,8];
    e(7,1:2) = [8,7];
    e(8,1:2) = [7,6];
    e(9,1:2) = [1,5];
    e(10,1:2) = [4,8];
    e(11,1:2) = [3,7];
    e(12,1:2) = [2,6];
end

function v = vertex(origin, x_length,y_length,z_length)            
                                
                % coordinates of cube are stored with
                % vertex name
                                
    v(1,1:3) = origin;
    v(2,1:3) = origin+[x_length,0,0];
    v(3,1:3) = origin+[x_length,0,z_length];
    v(4,1:3) = origin+[0,0,z_length];
    v(5,1:3) = origin+[0,y_length,0];
    v(6,1:3) = origin+[x_length,y_length,0];
    v(7,1:3) = origin+[x_length,y_length,z_length];
    v(8,1:3) = origin+[0,y_length,z_length];

%     v(1,1:3) = [1,2,3];
%     v(2,1:3) = [3,2,3];
%     v(3,1:3) = [3,2,6];
%     v(4,1:3) = [1,2,6];
%     v(5,1:3) = [1,6,3];
%     v(6,1:3) = [3,6,3];
%     v(7,1:3) = [3,6,6];
%     v(8,1:3) = [1,6,6];
end