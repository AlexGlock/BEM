function val = fundamentalEval(x,y,tt)
%FUNDAMENTALEVAL for 2D Laplace PDE
% evaluates the Laplace fundamental solution where input x
% is a static point and y_a and y_b are the endpoints of a linear mapping 
% on the interval [0,1] which the route is integrated over
% tt is the vector of evaluationpoints for the qaudrature routine

n = length(tt);

if n>1 % more than one evaluation timestep => y: variable in t
    val = zeros(1,n);
    y_a = y(:,1);
    y_b = y(:,2);
    
    % linear mapping of y
    y_t=@(t) y_a*(1.*t) + y_b'*(1.-t);
    
    % loop over every timestep
    for i = 1:n
        t_i = tt(i);
        y_i = y_t(t_i);
        val(i)= fundamentalsol(x, y_i);  
    end

else % simple evaluation at one t => y: scalar
    val = fundamentalsol(x, y);
end

end


