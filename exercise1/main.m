%% Aufgabenblatt 1 - BEM
% Code von Alexander Glock
clear all;
close all;
pkg load nurbs;

% #############################################################################
% # Task 1
% #############################################################################
% Number of points for the polygon
num = 25;
% The opptions are 'c', 'l' and 'b'
geometry = 'b';
% Make geometry approximation
points = mkGeom(num, geometry);

% Plotting
figure 1
plot(points(:,1), points(:,2),'-o', 'linewidth', 2)
hold on
axis('square')

% #############################################################################
% # Task 2
% #############################################################################
% calc colacation points in middle of 2D contour
colpts = zeros(length(points)-1,2);
rhs = zeros(length(points)-1,1);

for i = (1:1:length(points)-1)
    x_i = (points(i+1, 1)+points(i, 1))* 1/2;
    colpts(i,1) = x_i;
    y_i = (points(i+1, 2)+points(i, 2))* 1/2;
    colpts(i,2) = y_i;
    % calculate right hand side for each colpts
    rhs(i) = data(x_i, y_i);
end
% Plotting
plot(colpts(:,1), colpts(:,2),'x', 'linewidth', 2)

plotRHS(geometry, points, colpts, rhs)
