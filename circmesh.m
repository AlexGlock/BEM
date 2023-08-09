function [ptX,ptY] = circmesh(rho, theta) 
% circular mesh (?)
% r = 0:r_s:2;
% Shift the values towards the center, so you get a circle instead of an annulus.
% rho = r-min(r);
% Your meshgrid generation code.
% theta = (0:theta_s:360)*pi/180;
[th, r] = meshgrid(theta, rho);

% convert to cartesian matrix
ptX = r.*cos(th); % + max(r)
ptY = r.*sin(th);



end