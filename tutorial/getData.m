%% Data script - BEM
% Code von Alexander Glock
function f_vals = getData(x_vals,y_vals)
%GETDATA simple evaluation of a two dimensional function
%   this function is used in order ot get boundary data (dirichlet)
%   and compare the result to the continous "real" problem distribution
n = length(x_vals);
if n ~= length(y_vals)
   msg = 'input data has mismatching dimensions';
   error(msg)
end

f_vals = zeros(n,1);
f =@(x, y) sin(x)^2 + cos(y)^2;

for i=1:n
    f_vals(i) = f(x_vals(i), y_vals(i));
end

end
