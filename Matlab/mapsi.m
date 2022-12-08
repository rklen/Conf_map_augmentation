% mapsi.m
% compute the inverse of the conformal mapping from a square to a square
% and maps alpha to the origin
% Article: Image augmentation with conformal mappings for a convolutional neural network
% Dec 7, 2022
%
% We need to use the MATLAB code elliptic12.m from the Elliptic Integrals
% and Functions collection of MATLAB files, version 1.1.0.0 (15.2 KB) 
% by Moiseev Igor, 
% (https://www.mathworks.com/matlabcentral/fileexchange/8805-elliptic-integrals-and-functions?s_tid=srchtitle_elliptic12_1). 
%
function w = mapsi(z)
% 
r      =  1/sqrt(2); 
m      =  r^2;  m1=1-m;
[L1,~] =  ellipke(m);
L      =  L1*exp(i*pi/4)/2;
%
hz     =  sqrt(2)*exp(i*pi/4)*z./sqrt(1+i*z.^2);
tz     =  asin(hz);
%
x      =  real(tz); x(abs(x)<eps)=eps;
y      =  imag(tz);
%
b      = -(cot(x).^2+m*sinh(y).^2.*csc(x).^2-m1);
c      = -m1*cot(x).^2;
X1     = -b/2+sqrt(b.^2/4-c);
x1     =  acot(sqrt(X1));
x1     =  sign(cot(x)).*x1+pi*ceil(x/pi-0.5+eps);
%
y1     =  atan(sqrt((X1.*tan(x).^2-1)/m));
y1     =  sign(y).*real(y1);
%
w     = (elliptic12(x1,m)+i*elliptic12(y1,m1))./(sqrt(2)*L);
%
end