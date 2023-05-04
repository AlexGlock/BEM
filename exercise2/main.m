clear all;
close all;

% The approximate amount of elements to start with. The real number
% will be determined by mkGeom.
num = 5;

% Choose Geometry and corresponding rhs. 'l' for LShape, 's' for circle
geometry = 's';

% Initialize arrays for error and number of elements
err = [];


% Makes the geometry
Geom = mkGeom(num,geometry);
%plot(Geom(:,1), Geom(:,2),'-x', 'linewidth', 2)

% Assemble the matrix
% #############################################################################
% # Task 3b) + c)
% #############################################################################
A = mkMat(Geom);

% Assemble the RHS
U = mkRHS(Geom,geometry);

% Direct solver (CG wont work for collocation)
X = A\U';

% Evaluates the representation Formula and finds maximal potential error
% #############################################################################
% # Task 3d)
% #############################################################################
[ptX,ptX1,ptX2,ptY,ptY1,ptY2,val,val1,val2,err] = repformeval(err,geometry,Geom,X);

err

visualize(Geom,geometry,ptX,ptX1,ptX2,ptY,ptY1,ptY2,val,val1,val2,err);

