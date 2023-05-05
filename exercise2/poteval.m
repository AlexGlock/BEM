function val = poteval(ptX,ptY,Geom,X)

% #############################################################################
% # Task 3d)
% #############################################################################
% evaluates the solution in points (ptX, ptY)
% takes point cords, geometry (all mesh points), X solved coeff. vector
N = length(X);
y_dim = length(ptX(1,:))
x_dim = length(ptY(:,1))
val = zeros(x_dim, y_dim);

% loop over x scale
for (i = 1:x_dim)
    % loop over y scale
    for(j = 1:y_dim)

      point = [ptX(i,j); ptY(i,j)];
      for (n = 1:N)
        val(i,j) = quadgk(@(t) fundamental_eval(point, Geom(n,:)', t), 0, 1)*X(n);
      end

    end
  end
 end

function retval = fundamental_eval(x_i1, x_i2, t)
  % eval fundamental solution at point t
  retval = zeros(length(t),1);
  for (idx = 1:length(t))
    retval(idx) = fundamentalsol(x_i1, x_i1*t(idx) + x_i2*(t(idx)-1));
  end
end
