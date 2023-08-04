%% geometry script - BEM
% Code von Alexander Glock
function elems = makeGeometry(n, geom, r)
% init elems
elems = zeros(n, 2);

if geom=='c'
    % set radius of circle here
    %r = 2;
    for i = 1:n
        p=(2*pi/n)*i;
        elems(i,1)=r*cos(p);
        elems(i,2)=r*sin(p);
    end
else
   msg = 'invalid geometry choice';
   error(msg)
end

end