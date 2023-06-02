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
				sysmat(i,j) = analytSolGal(Geom(i,:), Geom(i+1,:));
      else
        % Uses the adaptive quadrature of matlab, which can deal with singularities at the endpoints of the intervals
				sysmat(i,j) = quadratureGal(Geom(j,:),Geom(j+1,:),Geom(i,:),Geom(i+1,:)); %quadratureCol(Geom(j,:),Geom(j+1,:),.5*(Geom(i,:)+Geom(i+1,:)));
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

% Analytical solution for the galerkin method
function val = analytSolGal(p1, p2)
      l = norm(p2-p1);
    val = (l^2*(3 - 2*log(l)))/(4*pi);
end

% Quadrature of the kernel wrt the collocation point colloc
function val = quadratureCol(p1,p2,colloc)
    l =   norm(p1-p2); % length of the element
    fun = @(x) fundamentalsol(x*p1+(1-x)*p2,colloc);
    val = l*quadgk(fun,0,1); % for octave, evaluation of the single layer integral
    % val = l*integral(fun,0,1,'ArrayValued',1); % for matlab, evaluation of the single layer integral
end

% Quadrature of the kernel wrt with galerkin method
function val = quadratureGal(pj1,pj2,pi1,pi2)
    lj = norm(pj1-pj2); % length of the element
    li = norm(pi1-pi2);
    val = li*lj*dblquad(@(a,b) galfunction(a,b,pj1,pj2,pi1,pi2),0,1,0,1); % for octave, evaluation of the single layer integral
    % val = l*integral(fun,0,1,'ArrayValued',1); % for matlab, evaluation of the single layer integral
end

% This function is necessary because dblquad is stupid.
% dblquad calls the function with one parameter as fix and the other parameter as vector.
% This is why galfunction with case detection of var param A or B is used.
function val = galfunction(a,b,pj1,pj2,pi1,pi2)
    a_n = size(a)(1);
    b_n = size(b)(1);

    f_x =@(x) x*pj1+(1-x)*pj2;
    f_y =@(y) y*pi1+(1-y)*pi2;

    if(a_n > b_n)
      val = zeros(a_n,1);
      for i = 1:a_n
        px = f_x(a(i,1));
        py = f_y(b);
        val(i) = fundamentalsol(px, py);
      end
    elseif(a_n <  b_n)
      val = zeros(b_n,1);
      for j = 1:b_n
        px = f_x(a);
        py = f_y(b(j,1));
        val(j) = fundamentalsol(px, py);
      end
    endif
end
