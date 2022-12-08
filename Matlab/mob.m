% mob.m
% The Mobius map
% the map is: w = (z-apl)/(1-alp'z)
% the inverse is: z = (w+apl)/(1+alp'w)
% Article: Image augmentation with conformal mappings for a convolutional neural network
% Dec 7, 2022
%
function U = mob( X, t )
Z = complex(X(:,1),X(:,2));
alpha = getGlobalx;
W = (Z-alpha)./(1-alpha'.*Z);
q = abs(Z) <= 1;
W(~q) = complex(NaN,NaN);
U(:,2) = imag(W);
U(:,1) = real(W);
end
%--------------------------------

