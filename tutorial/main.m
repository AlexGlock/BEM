%% tutorial main script - BEM
% Code von Alexander Glock
% Hier soll ein minmales Beispiel zur Lösung eines indirekten BEM Laplace
% problems in einem einfachen 2D Kreis implementiert werden.

plots = false;

% GEOMETRY ----------------------------------------------------------------
% n: numer of elements
n = 30;
geometry = 'c';
points = makeGeometry(n, geometry);
if plots == true
    scatter(points(:,1), points(:,2), 'x')
end

% COLLOCATION -------------------------------------------------------------
colpts = getColpts(points(:,1), points(:,2));

% ASSEMBLY 1 - right hand side --------------------------------------------
% rhs(i) = Sum(x_i * w_i) for constant basis functions rhs(i) = x_i
rhs = getData(colpts(:,1), colpts(:,2));
if plots == true
    figure()
    plot3(colpts(:,1), colpts(:,2), rhs, '-r')
end

% ASSEMBLY 2 - stiffness matrix -------------------------------------------
Vmat = makeVmat(points);

% SOLVING THE SYSTEM ------------------------------------------------------
w = Vmat\rhs;

% EVAL FUNDAMENTAL SOLUTION - on a meshgrid -------------------------------
% grid for potential evaluation
[ptX,ptY] = meshgrid(linspace(-1,1,13),linspace(-1,1,13));
solgrid = solutionEval(ptX,ptY,points,w);

% VISUALIZE - compare to analytic -----------------------------------------
% plot "analytic" solution
surf(ptX,ptY, getData(ptX,ptY))
title("analytic solution according to data fct")
% plot BEM solution
figure()
surf(ptX, ptY, solgrid)
title("numeric solution with indirect BEM")

% TODO
% circular meshing to fill whole domain 


 


