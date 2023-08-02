function Vmat = makeVmat(elems)
%MAKEVMAT creates the stiffness matrix for a indirect dirichlet BEM prob.
n = length(elems(:,1))-1;
Vmat = zeros(n, n);

for i=1:n-1
 for j=1:n-1
    x_i = elems(i,:)';
    x_ii = elems(i+1,:)';
    func =@(t) fundamentalEval(x_i,x_ii,t);
    % eval integral
    Vmat(i, j) = quadgk(func,0,1);
 end
end

end

