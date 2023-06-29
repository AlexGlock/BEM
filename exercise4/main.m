clear all;
close all;

% The approximate amount of elements to start with. The real number 
% will be determined by mkGeom.
num = 10;

% Choose Method: 'c' for collocation, 'g' for Galerkin
method = 'g'
% Choose Geometry and corresponding rhs. 'l' for LShape, 's' for circle
geometry = 'l';

% Initialize arrays for error and number of elements
err = [];
nums = [];

% Makes the geometry
Geom = mkGeom(num,geometry);

% Assemble the matrix
A = mkMat(Geom,method);
  
% Assemble the RHS
U = mkRHS(Geom,geometry,method);
  
% Direct solver (CG wont work for collocation)
X = A\U';

% Evaluates the representation Formula and finds maximal potential error
[ptX,ptX1,ptX2,ptY,ptY1,ptY2,val,val1,val2,err] = repformeval(err,geometry,Geom,X);

err

visualize(Geom,geometry,ptX,ptX1,ptX2,ptY,ptY1,ptY2,val,val1,val2,err);

