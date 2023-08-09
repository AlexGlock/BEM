%% Colpts script - BEM
% Code von Alexander Glock
function colpts = getColpts(pts)
% Collpoints by simple collocation

n = length(pts(:,1));
colpts=zeros(n,2);

for i=1:n
    % colpts in middle of element
    if i==n
        colpts(i,:) = pts(i,:)+.5*(pts(1,:)-pts(i,:));
    else
        colpts(i,:) = pts(i,:)+.5*(pts(i+1,:)-pts(i,:));
    end
end

end

