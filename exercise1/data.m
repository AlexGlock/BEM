function out = data(ptX,ptY)
	% This function is used to generate the right hand side via 
    % the function f, also used to check the convergence.
    % One can define different f for different geometries
  
    f = @(x,y) cos(x).*sin(y);

    out = f(ptX,ptY);
end