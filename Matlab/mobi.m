% mobi.m
% inverse of the Mobius map
% the map is: w = (z-apl)/(1-alp'z)
% the inverse is: z = (w+apl)/(1+alp'w)
% Article: Image augmentation with conformal mappings for a convolutional neural network
% Dec 7, 2022
%
function U = mobi( X, t )
W = complex(X(:,1),X(:,2));
alpha = getGlobalx;
Z = (W+alpha)./(1+alpha'.*W);
q = abs(W) <= 1;
Z(~q) = complex(NaN,NaN);
U(:,2) = imag(Z);
U(:,1) = real(Z);
end
%--------------------------------

