function evalgrid = solutionEval(ptX,ptY,points,w)
% this function evaluates the BEM solution (== representation formula) on 
% a meshgrid.

[nx,ny] = size(ptX);
n = length(w(:,1));
evalgrid = zeros(nx,ny);
% Evaluate indirect representation-formula
% g(x) = (Vw)(x) ...

for i = 1:nx
    for j = 1:ny
        % mesh point
        x = [ptX(i,j), ptY(i,j)];
        for k = 1:n
            % boundary endpoints for one element
            y_i = points(k,:)';
            if k==n
                y_ii = points(1,:)';
            else
                y_ii = points(k+1,:)';
            end
            % building Integralfunction
            func =@(t) fundamentalEval(x,[y_i,y_ii],t);
            evalgrid(i,j) = evalgrid(i,j) + w(k)*quadgk(func,0,1)*norm(y_i-y_ii,2);
        end
    end
end

end

