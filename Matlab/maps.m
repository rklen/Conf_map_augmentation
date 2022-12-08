% maps.m
% compute the the conformal mapping from a square to a square and maps
% alpha to the origin
% Article: Image augmentation with conformal mappings for a convolutional neural network
% Dec 7, 2022
%
function w = maps(z)
% 
% 
r          =  1/sqrt(2); 
m          =  r^2;
[L1,~]     =  ellipke(m);
L          =  L1*exp(i*pi/4)/2;
% 
hz         =  sqrt(2)*L*z;
%
[s0,c0,d0] =  ellipj(real(hz),m);
[s1,c1,d1] =  ellipj(imag(hz),1-m);
delta      =  c1.^2+m*s0.^2.*s1.^2;
%
sni        = (s0.*d1+i*c0.*d0.*s1.*c1)./delta;
dni        = (d0.*c1.*d1-i*m.*s0.*c0.*s1)./delta;
%
w          =  sni./(sqrt(2)*exp(i*pi/4)*dni);
%
end