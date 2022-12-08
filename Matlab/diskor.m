%remove the part of the image out of the unit circle
%--------------------------------------
function U = diskor( X, t )
Z = complex(X(:,1),X(:,2));
W = ((Z));
q = abs(Z) <= 1;
W(~q) = complex(NaN,NaN);
U(:,2) = imag(W);
U(:,1) = real(W);
%-------------------------------------