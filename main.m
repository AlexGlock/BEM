%% tutorial main script - BEM
% Code von Alexander Glock
% Hier soll ein minmales Beispiel zur Lösung einer indirekten Innenraum 
% BEM für das Laplace problem in einem 2D Kreis implementiert werden.

analytic_plot = true;

% GEOMETRY ----------------------------------------------------------------
% n: numer of elements, 'c':= circle
n = 20;
geometry = 'c';
r = 2;

points = makeGeometry(n, geometry, r);

% COLLOCATION -------------------------------------------------------------
colpts = getColpts(points);

% ASSEMBLY 1 - right hand side --------------------------------------------
% rhs(i) = Sum(x_i * w_i) for constant basis functions rhs(i) = x_i
rhs = makeRHS(points,colpts);

figure()
subplot(1,2,1);
scatter3(colpts(:,1), colpts(:,2), rhs, 'o','filled','MarkerFaceColor',[1 0 0])
hold on
for i=1:n
    plot3([colpts(i,1), colpts(i,1)], [colpts(i,2), colpts(i,2)], [0, rhs(i)], 'b--')
end
hold on
pts = [points;points(1,:)];
plot3(pts(:,1), pts(:,2), getData(pts(:,1),pts(:,2)), 'g-') 
title('boundary data')


% ASSEMBLY 2 - stiffness matrix -------------------------------------------
Vmat = makeVmat(points, colpts);

% SOLVING THE SYSTEM ------------------------------------------------------
w = Vmat\rhs;

% EVAL FUNDAMENTAL SOLUTION - on a meshgrid -------------------------------
% grid for potential evaluation
[ptX,ptY] = circmesh((0:.1*r:.99*r), (0:6:360)*pi/180);
%[ptX,ptY] = meshgrid(linspace(-1,1,13),linspace(-1,1,13));

solgrid = solutionEval(ptX,ptY,points,w);

% VISUALIZE - compare to analytic -----------------------------------------
% plot BEM solution
subplot(1,2,2);
surf(ptX, ptY, solgrid)
hold on
scatter3(colpts(:,1), colpts(:,2), rhs, 'filled','MarkerFaceColor',[1 0 0]);
title("numeric solution with indirect BEM")

if analytic_plot == true
    % plot "analytic" solution
    figure()
    surf(ptX,ptY, getData(ptX,ptY))
    hold on
    scatter3(colpts(:,1), colpts(:,2), rhs, 'filled','MarkerFaceColor',[1 0 0]);
    title("analytic solution according to data fct")
end
    
