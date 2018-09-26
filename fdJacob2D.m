function J = fdJacob2D (l, theta,alpha)

%uses central differences to compute the Jacobian using step-size alpha
param1 = (evalRobot2D(l,theta + [alpha ; 0]) - evalRobot2D(l, theta - [alpha ; 0]))/(2 * alpha);
param2 = (evalRobot2D(l,theta + [0 ; alpha]) - evalRobot2D(l, theta - [0 ; alpha]))/(2 * alpha);
J = [param1, param2];

end

