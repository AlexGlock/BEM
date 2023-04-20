function fig = plotRHS(geometry, points, colpts, coef)

  pt = [points(:, 1)'; points(:, 2)'; zeros(1, size(points, 1))];
  coef = coef';
  colpts = colpts';
  pt1 = reshape(repmat([pt(1,:);pt(2,:)],2,1),2,2*(size(pt,2)));
  val1 = circshift(reshape(repmat([coef,coef(end)],2,1),1,2*size(pt,2)), 1);

  if ( geometry == 'b')
    fig = figure ('units','normalized','position',[0 0 1 1]);
    subplot(1,2,1)

      tx = linspace (-2, 1, 41)';
      ty = linspace (0, 1, 41)';
      tz = linspace (0, 1, 41)';
      [xx, yy] = meshgrid (tx, ty);
      tz = data(xx,yy);
      mesh (tx, ty, tz);
      hidden('off')
      hold on

      % plot function evaluated on curve
      ut = linspace(0.0,1.0,200);
      crv = getBezierCurve();
      pt2 = nrbeval(crv,ut);
      plot3(pt2(1,:),pt2(2,:),data(pt2(1,:),pt2(2,:)),'linewidth',4)

      nrbplot(crv,100)
      axis('square')
      grid on
      axis([-2 1 0 1 0 1])
      xlabel('x')
      ylabel('y')
      zlabel('z')
      legend('f(x,y)','f(c(t))', 'c(t)')
      title('Function to approximate')

    % plot first naive approximation
    subplot(1,2,2)

      plot3(pt(1,:),pt(2,:),pt(3,:), 'marker', 'o','linewidth',2)
      hold on
      nrbplot(crv,100)
      hold on 
      plot3(pt1(1,:),pt1(2,:),val1,'linewidth',4)
      hold on
      plot3(pt2(1,:),pt2(2,:),data(pt2(1,:),pt2(2,:)),'linewidth',4)
      plot(colpts(1,:), colpts(2,:),'linestyle','none','marker','o','color','k')
      axis('square')
      grid on
      axis([-2 1 0 1 0 1])
      xlabel('x')
      ylabel('y')
      zlabel('z')
      legend('polygon', 'c(t)', 'collocation','f(c(t))')
      title('Approximation')
  else
    fig = figure ('units','normalized','position',[0 0 1 1]);
    plot3(pt(1,:),pt(2,:),pt(3,:), 'marker', 'o','linewidth',2)
    hold on 
    plot3(pt1(1,:),pt1(2,:),val1,'linewidth',4)
    plot(colpts(1,:), colpts(2,:),'linestyle','none','marker','x','color','k')
    axis('square')
    grid on
    xlabel('x')
    ylabel('y')
    zlabel('z')
    legend('polygon', 'approximation', 'collocation points')
    title('Approximation')

  end

end