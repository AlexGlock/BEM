%% tutorial main script - BEM
% Code von Alexander Glock
% Hier soll ein minmales Beispiel zur Lösung einer indirekten Innenraum 
% BEM für das Laplace problem in einem 2D Kreis implementiert werden.

plots = false;

% GEOMETRY ----------------------------------------------------------------
% n: numer of elements, 'c':= circle
n = 30;
geometry = 'c';
r = 3;

points = makeGeometry(n, geometry, r);

if plots == true
    figure()
    subplot(1,2,1);
    scatter(points(:,1), points(:,2), 'x')
end

% COLLOCATION -------------------------------------------------------------
colpts = getColpts(points);

% ASSEMBLY 1 - right hand side --------------------------------------------
% rhs(i) = Sum(x_i * w_i) for constant basis functions rhs(i) = x_i
rhs = makeRHS(points,colpts);

if plots == true
    subplot(1,2,2);
    plot3(colpts(:,1), colpts(:,2), rhs, '-r')
end

% ASSEMBLY 2 - stiffness matrix -------------------------------------------
Vmat = makeVmat(points, colpts);

% SOLVING THE SYSTEM ------------------------------------------------------
w = Vmat\rhs;

% EVAL FUNDAMENTAL SOLUTION - on a meshgrid -------------------------------
% grid for potential evaluation
[ptX,ptY] = circmesh((0:.1:r*.9), (0:6:360)*pi/180);
%[ptX,ptY] = meshgrid(linspace(-1,1,13),linspace(-1,1,13));

solgrid = solutionEval(ptX,ptY,points,w);

% VISUALIZE - compare to analytic -----------------------------------------
% plot "analytic" solution
figure()
subplot(1,2,1);
surf(ptX,ptY, getData(ptX,ptY))
hold on
scatter3(colpts(:,1), colpts(:,2), rhs, 'filled','MarkerFaceColor',[1 0 0]);
title("analytic solution according to data fct")
% plot BEM solution
subplot(1,2,2);
surf(ptX, ptY, solgrid)
hold on
scatter3(colpts(:,1), colpts(:,2), rhs, 'filled','MarkerFaceColor',[1 0 0]);
title("numeric solution with indirect BEM")

% TODO
% circular meshing to fill whole domain 


 


