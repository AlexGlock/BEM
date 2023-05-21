function rhs = mkRHS( Geom ,c,method)

if(method == 'c')

	% Takes the Geometry and intializes a right hand side given from data()
	n = length(Geom)-1;
	rhs = zeros(1,n);

	for i = 1:n
	% (x,y) is the midpoint of the geometry segment, i.e. the collocation point.
	   x = .5*(Geom(i,1)+Geom(i+1,1));
	   y = .5*(Geom(i,2)+Geom(i+1,2));
	   rhs(i) = data(x,y,c);
	end
elseif(method == 'g')

	% Takes the Geometry and intializes a right hand side given from data()
	n = length(Geom)-1;
	rhs = zeros(1,n);
	% #############################################################################
	% # Task 4c)
	% #############################################################################
	for i = 1:n % loop over elements (index)
    p1 = [Geom(i,1); Geom(i,2)];
    p2 = [Geom(i+1,1); Geom(i+1,2)];
    l = norm(p1-p2);
    % contant basis function (1), so only own basis relevant
    fun = @(w) data(w*p1(1)+(1-w)*p2(1), w*p1(2)+(1-w)*p2(2), method)
    rhs(i) = l*quadgk(fun,0,1)
  endfor

end

end

