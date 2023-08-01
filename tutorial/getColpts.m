%% Colpts script - BEM
% Code von Alexander Glock
function colpts = getColpts(x_vals,y_vals)
% Collpoints by simple collocation
n = length(x_vals);
if n ~= length(y_vals)
   msg = 'input data has mismatching dimensions';
   error(msg)
end

colpts=zeros(n-1,2);

for i=1:n-1
    % x coord.
    colpts(i,1) = (x_vals(i)+x_vals(i+1))/2;
    % y coord.
    colpts(i,2) = (y_vals(i)+y_vals(i+1))/2;
end

end
