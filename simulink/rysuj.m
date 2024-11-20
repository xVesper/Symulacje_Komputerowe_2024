function rysuj(y,R,H)
fill([-1 -1 1 1],[-0.1 0 0 -0.1],'r')
hold on
if y<R
    Rx=R+R-y;
    Ry=y;
else
    Rx=R;
    Ry=R;
end
alpha = linspace(0,2*pi,50);
fill(Rx*cos(alpha),Ry*sin(alpha)+y,'b')
axis([-1 1 -R R+H])
axis off
hold off
drawnow
end