function rhs = makeRHS(pts,colpts)
% MAKERHS assambles the right hand side for a dirichlet problem using the
% collocation method
n = length(colpts(:,1));
rhs = zeros(n,1);

for i = 1:n
    rhs(i) = getData(colpts(i,1), colpts(i,2)) * norm(pts(i+1,:)-pts(i,:),2);
end

end

