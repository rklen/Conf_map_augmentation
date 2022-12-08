% image_square_to_square_2.m
% This is an example on how to map a square image to a square image such 
% that a point alpha (a pixel) is mapped to the origin.
% Article: Image augmentation with conformal mappings for a convolutional neural network
% Dec 7, 2022
% 
clear 
%%
A = imread('Picture1.png');
[m,n,~] =  size(A);
mm = 150; nn = 140;
%
figure, imshow(A);
hold on
% plot(mm,nn,'or','MarkerfaceColor','r')
axis on
grid on
title('Original Image');
%%
alpha = -1+2*mm/m+(1-2*nn/n)*i
setGlobalx(alpha);
%%
uData = [ -1.0   1.0];  % Bounds for REAL(w)
vData = [  1.0  -1.0];  % Bounds for IMAG(w)
%
xData = [ -1.0   1.0];  % Bounds for REAL(z)
yData = [  1.0  -1.0];  % Bounds for IMAG(z)
%%
ring = maketform('custom', 2, 2, [], @cmapi, []);
Bring = imtransform(A, ring, 'cubic',...
                    'UData', uData, 'VData', vData,...
                    'XData', xData, 'YData', yData,...
                    'Size', [m n], 'FillValues', 255 );
figure, imshow(Bring); 
hold on
% plot(m/2,n/2,'or','MarkerfaceColor','r')
axis on
grid on
title('Transformed Image');
%%