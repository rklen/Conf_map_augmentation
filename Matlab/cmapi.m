function U = cmapi( X, t )
W      =  complex(X(:,1),X(:,2));
alp    =  getGlobalx;
Z      =  mapi(W,alp);
U(:,2) =  imag(Z);
U(:,1) =  real(Z);
end
%--------------------------------

