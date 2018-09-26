function theta = invKin2D(l,theta,pos,n,mode)
threshold = 0.000001; %initialized threshold, changeable
if mode == 1
    theta = newton(l,theta,pos,n,threshold); %moode 1
elseif mode == 2 
    theta = broyden(l,theta,pos,n,threshold); %mode 2

end
end

%Newton Method
%Iterating n times then stop else if threshold satisfied it will stop
function theta = newton(l,theta,pos,n,threshold)
for i = 1:n
    [p,J] = evalRobot2D(l, theta); %finding position and jacobian 
    f = p - pos;  %finding difference between the target pos to real pos
    s = -J\(f); %find solution
    theta = theta + s; %updating
    if abs(norm(p - pos)) < threshold
        break
    end
end
end

%Broyden Method
%Iterating n times then stop else if threshold satisfied it will stop
function theta = broyden(l, theta, pos, n ,threshold)
[~, J] = evalRobot2D(l,theta);
for i = 1:n
    p = evalRobot2D(l,theta); %finding pos and jacob
    f = p - pos;  %finding difference between target and real pos
    s = -J\(f); %finding solution
    newtheta = theta + s; %updating
    y = evalRobot2D(l,newtheta) - evalRobot2D(l, theta); %position according to differences by thetas
    J = J + ((y - J * s) * s')/(s' *s); %calculate jacobian by approximation
    if  abs(norm(p - pos)) <threshold
        break;
    end
    theta = newtheta;
end
end

    
    
    