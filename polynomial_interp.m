function Y_new = polynomial_interp(X,Y,X_new,n) 

    if(length(X) < n+1)  %If the number of independent variable length is less than required points
        n = length(X) - 1; % change the number of independent variable vector with decremented by one
    end
		
    b = Y(1:n+1);
   
    %Form the monomial matrix to solve for interpolation polynomial coefficients
    for i = 1:n+1
        M(i,:) = X(1:n+1).^(n-i+1);
    end
	
    M = M';
    
	%	M=[x0^n,x0^(n-1),....,x0^1,x0,1;
	%	   x1^n,x1^(n-1),....,x1^1,x1,1;
	%	   x2^n,x2^(n-1),....,x2^1,x2,1;
	%	   ............................;
	%	   xn^n,xn^(n-1),...,xn^1,xn,1]
	
	% to get an,an-1,an-2,...,a1,a0 oefficients 
	coeff = M\b;
    
	%Now using the polynomial p(x)=an*x^n+...+a2*x^2+a1*x+a0]
    for i = 1:length(X_new) %iterating over all points required to get their interpolation
        Y_new(i) = 0;
        for j = 1:n+1 %iterate for every term in the interpolating polynomials
            Y_new(i) = Y_new(i)+coeff(j)*X_new(i)^(n-j+1);
        end
    end
    Y_new = Y_new'; % we need column vector at the end
    
end

