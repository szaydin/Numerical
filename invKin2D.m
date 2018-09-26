function theta = invKin2D(l,theta0,pos,n,mode)
threshold = 0.000001; %initialized threshold, changeable
if mode == 1
    theta = newton(l,theta0,pos,n,threshold); %moode 1
elseif mode == 2 
    theta = broyden(l,theta0,pos,n,threshold); %mode 2

end
end

%Newton Method
%Iterating n times then stop else if threshold satisfied it will stop
function theta0 = newton(l,theta0,pos,n,threshold)
for i = 1:n
    [p,J] = evalRobot2D(l, theta0); %finding position and jocobian 
    f = p - pos;  %finding difference between the target pos to real pos
    s = -J\(f); %find solution
    theta0 = theta0 + s; %updating
    if abs(norm(p - pos)) < threshold
        break
    end
end
end

%Broyden Method
%Iterating n times then stop else if threshold satisfied it will stop
function theta = broyden(l, theta0, pos, n ,threshold)
for i = 1:n
    [p, J] = evalRobot2D(l,theta0); %finding pos and jacob
    f = p - pos;  %finding difference between target and real pos
    s = -J\(f); %finding solution
    theta = theta0 + s; %updating
    y = evalRobot2D(l,theta) - evalRobot2D(l, theta0); %position according to differences by thetas
    J = J + ((y - J * s) * s')/(s' *s); %calculate jacobian by approximation
    if  abs(norm(p - pos))<threshold
        break;
    end
    theta0 = theta;
end
end

    
    
    