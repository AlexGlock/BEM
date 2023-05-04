function rhs = mkRHS(Geom, c)
	
% Takes the Geometry and intializes a right hand side given from data()
n = length(Geom)-1;
rhs = zeros(1,n);

for i = 1:n
% (x,y) is the midpoint of the geometry segment, i.e. the collocation point.  
   x = .5*(Geom(i,1)+Geom(i+1,1));
   y = .5*(Geom(i,2)+Geom(i+1,2));
   rhs(i) = data(x,y,c);
end


end

