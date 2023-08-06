function Vmat = makeVmat(pts, colpts)
%MAKEVMAT creates the stiffness matrix for a indirect dirichlet BEM prob.
n = length(colpts(:,1));
Vmat = zeros(n, n);

for i=1:n
    % get matching colpts
    p_i = colpts(i,:)';
 for j=1:n
    % get elem start/end point
    p_j1 = pts(j,:)';
    if j==n
        p_j2 = pts(1,:)';
    else
        p_j2 = pts(j+1,:)';
    end
    % build integral function
    Intfunc=@(t) fundamentalEval(p_i, [p_j1, p_j2], t);
    % eval integral
    Vmat(i, j) = norm(p_j2-p_j1,2)*quadgk(Intfunc,0,1);
 end
end

end

