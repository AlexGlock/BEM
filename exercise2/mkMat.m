function sysmat = mkMat(Geom)
%
%	Assembles the Matrix. Gets the geometry as input and uses piecewise constant functions.
%
% #############################################################################
% # Task 3c)
% #############################################################################


dim = length(Geom(:,1))-1;
sysmat = zeros(dim, dim);

% loop over rows
  for(i = 1:dim)
    x_i1 = Geom(i,:)';
    x_i2 = Geom(i+1,:)';
    % loop over cols
    for(j = 1:dim)
      % is diag element
      if (i==j)
        sysmat(i,j) = 0.01;
      % no diag element
      else
        sysmat(i,j) = quadgk(@(t) fundamental_eval(x_i1, x_i2, t), 0, 1);
      end
    end
  end

end

function val = fundamental_eval(x_i1, x_i2, t)
  % eval fundamental solution at point t
  val = zeros(length(t),1);
  for (idx = 1:length(t))
    val(idx) = fundamentalsol(x_i1, x_i1*t(idx) + x_i2*(t(idx)-1));
  end
end




