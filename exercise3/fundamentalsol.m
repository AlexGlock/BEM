function val = fundamentalsol(p1,p2)
  %n = length(p1(1,:))
  %val = zeros(n, 1)
  %for i = 1:n
  val = -(1./(2*pi))*log(norm(p1-p2,2)); % (1./(2*pi))*
  %endfor

end
