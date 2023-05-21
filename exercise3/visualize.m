function visualize(Geom,c,ptX,ptX1,ptX2,ptY,ptY1,ptY2,val,val1,val2,err)

% Plot the geometry and solution
if(c == 's' || c == 'c')
	subplot(2,2,1)
        title('Computed Solution')
        hold on   
        plot(Geom(:,1),Geom(:,2))
        surf(ptX,ptY,val);
        hold off
        subplot(2,2,2)
        hold on
        title('Analytical solution')
        surf(ptX,ptY,data(ptX,ptY,c));
        hold off
        subplot(2,2,3)
        title('Error')
        hold on   
        plot(Geom(:,1),Geom(:,2),'linewidth',2)
        surf(ptX,ptY,data(ptX,ptY,c)-val);
        colorbar
	elseif (c == 'l')
        subplot(2,2,1)
        title('Computed Solution')
        hold on
        plot(Geom(:,1),Geom(:,2))
        surf(ptX1,ptY1,val1);
        surf(ptX2,ptY2,val2);
        hold off
        subplot(2,2,2)
        hold on
        title('Analytical solution')
        surf(ptX1,ptY1,data(ptX1,ptY1,c));
        surf(ptX2,ptY2,data(ptX2,ptY2,c));
        hold off
        subplot(2,2,3)
        hold on
        title('Error')
        plot(Geom(:,1),Geom(:,2))
        surf(ptX1,ptY1,data(ptX1,ptY1,c)-val1);
        surf(ptX2,ptY2,data(ptX2,ptY2,c)-val2);
        colorbar
        hold off
end

end
