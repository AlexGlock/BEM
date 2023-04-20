function geom = mkGeom(n, c)
% Makes a geometry consisting of n linear pieces. Remember diam < 1!
%
% INPUT:
%
%   n		: Number of points for the polygon
%
%   c		: String for the curve selection
%
% OUTPUT:
%
%   geom	: Coordinates of the points [x-values, y-values]

% Will construct a circle geometry
geom = [];
if ( c == 'c')
  % #########################################################################
  % # Task 1a)
  % #########################################################################
  f = @(t) [0.01*cos(2*pi*t); 0.01*sin(2*pi*t)];
  % calculate equidistant timesteps
  step = 1/n;
  dis_t = (0:step:1);
  % get coords of respective times
  geom = transpose(f(dis_t));

% Will construct an l-shape domain
elseif( c == 'l')
  % #########################################################################
  % # Task 1d)
  % #########################################################################
  % round up to next multiple of 8
  fac = ceil(n/8);
  n_ceil = 8*fac
  % calculate equidistant timesteps
  step = 1/n_ceil;
  dis_t = (0:step:1);
  % get coords of respective times
  geom = transpose(getLcurve(dis_t));


% construction of the Bezier curve
elseif( c == 'b')
	% ###########################################################################
	% # Task 1b)
	% ###########################################################################
	% use nrbeval from the nurbs package (https://octave.sourceforge.io/nurbs/)
	crv = getBezierCurve();
    % calculate equidistant timesteps
    step = 1/n;
    dis_t = (0:step:1);
    % get coords of respective times
    geom_3d = nrbeval(crv, dis_t);
    % 2D = Z-direction 0 + transpose vector for plot
    geom = transpose(geom_3d(1:2,:));

else
	% default example for the return of the function
	geom = [0, 0; 1, 0; 1, 1; 0, 1; 0, 0];
end

