%% tutorial main script - BEM
% Code von Alexander Glock

% Hier soll ein minmales Beispiel zur Lösung eines BEM Laplace problems
% in einem einfachen 2D Kreis implementiert werden.

% GEOMETRY
% n: numer of elements
n = 80;
geometry = 'c';

elems = makeGeometry(n, geometry);
scatter(elems(:,1), elems(:,2), 'x')

% COLLOCATION
colpts = getColpts(elems(:,1), elems(:,2));

% BOUNDARY DATA
% get dirichlet data for coplts
b_data = getData(colpts(:,1), colpts(:,2));
figure()
plot3(colpts(:,1), colpts(:,2), b_data, '-r')

% ASSEMBLY
% TODO: build stifness matrix for constant basis fcts