function theta = invKin3D(M, theta, pos)
threshold = 0.0001;
n = 1000;
for i = 1:n
    [p,J] = evalRobot3D(M, theta); %evaluating position and Jacobian
    f = p - pos; %finding difference between the target pos to real pos
    s = -J\(f); %finding solution
    theta = theta + s; %updating
    if abs(norm(p - pos)) < threshold %checking if it is close to the target
        break
    end
end
end
