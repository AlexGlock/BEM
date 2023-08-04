%% Colpts script - BEM
% Code von Alexander Glock
function colpts = getColpts(pts)
% Collpoints by simple collocation

n = length(pts(:,1))-1;
colpts=zeros(n,2);

for i=1:n
    % colpts in middle of element
    colpts(i,:) = .5*(pts(i,:)+pts(i+1,:));
end

end

