function Vmat = makeVmat(pts)
%MAKEVMAT creates the stiffness matrix for a indirect dirichlet BEM prob.
n = length(pts(:,1))-1;
Vmat = zeros(n, n);

for i=1:n
    p_i = pts(i,:)';
 for j=1:n
    p_j1 = pts(j,:)';
    p_j2 = pts(j+1,:)';
    % build integral function
    Intfunc=@(t) fundamentalEval(p_i, [p_j1, p_j2], t);
    % eval integral
    Vmat(i, j) = quadgk(Intfunc,0,1);
 end
end

end

