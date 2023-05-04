function val = poteval(ptX,ptY,Geom,X)

% #############################################################################
% # Task 3d)
% #############################################################################
% evaluates the solution in points (ptX, ptY)
% takes point cords, geometry (all mesh points), X solved coeff. vector
N = length(Geom(:,1))-1;
val = zeros(length(ptX),1);

% loop over every eval point
  for (p_idx = 1:length(ptX))
    point = [ptX(p_idx); ptY(p_idx)];
    val_j = 0;
    % loop over every element: Geom(:,j)' = collacation point of elem j
    for(j = 1:N)
      val_j += quadgk(@(t) fundamental_eval(point, Geom(j,:)', t), 0, 1)*X(j);
    end
    val(p_idx) = val_j;
  end
 end

function val = fundamental_eval(x_i1, x_i2, t)
  % eval fundamental solution at point t
  val = zeros(length(t),1);
  for (idx = 1:length(t))
    val(idx) = fundamentalsol(x_i1, x_i1*t(idx) + x_i2*(t(idx)-1));
  end
end
