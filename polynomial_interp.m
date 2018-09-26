function Y_new=polynomial_interp(X,Y,X_new,n)

p = polyfit(X,Y,n);
Y_new = polyval(p,X_new);

end