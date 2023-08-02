function val = fundamentalEval(x_i,x_ii, t)
%FUNDAMENTALEVAL for 2D Laplace PDE

n = length(t);
val = zeros(1,n);

% linear mapping
yi=@(t) x_i*(1.*t) + x_ii'*(1.-t);

% fundamental solution fct.
fundSol =@(x, y) -1/(2*pi)*log(norm(x-y));

% loop over every timestep
for i = 1:n
    t_i = t(i);
    y_i = yi(t_i);
    val(i)= fundSol(x_i, y_i);  
end


