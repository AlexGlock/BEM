%% Data script - BEM
% Code von Alexander Glock
function f_vals = getData(x_vals,y_vals)
%GETDATA simple evaluation of a two dimensional function
%   this function is used in order ot get boundary data (dirichlet)
%   and compare the result to the continous "real" problem distribution
[nx, ny] = size(x_vals);
[nx2, ny2] = size(y_vals);
if nx ~= nx2 || ny ~= ny2
   msg = 'input data has mismatching dimensions';
   error(msg)
end

f_vals = zeros(nx,ny);
f =@(x, y) sin(x)^2 + cos(y)^2;

for xi=1:nx
    for yi=1:ny
        f_vals(xi,yi) = f(x_vals(xi,yi), y_vals(xi,yi));
    end
end

end
