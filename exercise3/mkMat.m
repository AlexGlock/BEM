function sysmat = mkMat(Geom,method)
%
%	Assembles the Matrix. Gets the geometry as input and uses piecewise constant functions.
%

if(method == 'c')

	n = length(Geom)-1;
	sysmat = zeros(n);

	for i = 1:n
		for j = 1:n
			if(i == j)
				% Uses the analytical solution
				sysmat(i,j) = analytSolCol(Geom(i,:),Geom(j+1,:));
      else
        % Uses the adaptive quadrature of matlab, which can deal with singularities at the endpoints of the intervals
				sysmat(i,j) = quadratureCol(Geom(j,:),Geom(j+1,:),.5*(Geom(i,:)+Geom(i+1,:)));
			end
		end
	end
else
	n = length(Geom)-1;
	sysmat = zeros(n);
	% #############################################################################
	% # Task 4d)
	% #############################################################################
		for i = 1:n
		for j = 1:n
			if(i == j)
				% Uses the analytical solution
				sysmat(i,j) = 1;
      else
        % Uses the adaptive quadrature of matlab, which can deal with singularities at the endpoints of the intervals
				sysmat(i,j) = quadratureGal(Geom(j,:),Geom(j+1,:)); %quadratureCol(Geom(j,:),Geom(j+1,:),.5*(Geom(i,:)+Geom(i+1,:)));
			end
		end
	end
end

end


% Analytical solution for the collocation singular case
function val = analytSolCol(p1,p2)
    l = norm(p2-p1);
	val = -(1./(2*pi))*l*(log(l/2)-1)
	val1 = -l /(2*pi) * (log(l) - 4)
end

% Quadrature of the kernel wrt the collocation point colloc
function val = quadratureCol(p1,p2,colloc)
    l =   norm(p1-p2); % length of the element
    fun = @(x) fundamentalsol(x*p1+(1-x)*p2,colloc);
    val = l*quadgk(fun,0,1); % for octave, evaluation of the single layer integral
    % val = l*integral(fun,0,1,'ArrayValued',1); % for matlab, evaluation of the single layer integral
end

% Quadrature of the kernel wrt with galerkin method
function val = quadratureGal(p1,p2)
    l =   norm(p1-p2); % length of the element

    val = l*l*dblquad(@(x, y) fundamentalsol(x*p1+(1-x)*p2,y*p1+(1-y)*p2),0,1,0,1); % for octave, evaluation of the single layer integral
    % val = l*integral(fun,0,1,'ArrayValued',1); % for matlab, evaluation of the single layer integral
end
