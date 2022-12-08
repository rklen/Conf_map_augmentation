function U = cmap( X, t )
%
Z       =  complex(X(:,1),X(:,2));
alp     =  map(getGlobalx); 
W       =  map(Z,alp);
U(:,2)  =  imag(W);
U(:,1)  =  real(W);
%
end