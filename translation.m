%rotation
function A = translation(d)
A=[1,0,0,0
   0,1,0,0
   0,0,1,0
   d(1),d(2),d(3),1];
end