%% tutorial main script - BEM
% Code von Alexander Glock

% Hier soll ein minmales Beispiel zur Lösung eines indirekten BEM Laplace
% problems in einem einfachen 2D Kreis implementiert werden.

% GEOMETRY
% n: numer of elements
n = 80;
geometry = 'c';

elems = makeGeometry(n, geometry);
scatter(elems(:,1), elems(:,2), 'x')

% COLLOCATION
colpts = getColpts(elems(:,1), elems(:,2));

% ASSEMBLY 1 - right hand side
% rhs(i) = Sum(x_i * w_i) for constant basis functions rhs(i) = x_i
rhs = getData(colpts(:,1), colpts(:,2));
figure()
plot3(colpts(:,1), colpts(:,2), rhs, '-r')

% ASSEMBLY 2 - stifness matrix
Vmat = makeVmat(elems);

% SOLVING THE SYSTEM - backslash routine
w = Vmat\rhs';

% TODO - evaluate fundamental solution on grid
% g =@(x) 





