% image_mobius_disk_to_disk_2.m
% This is an example on how to map an image (in disk) to an image (in disk) 
% such that a point alpha (a pixel) is mapped to the origin.
% Article: Image augmentation with conformal mappings for a convolutional neural network
% Dec 7, 2022
% 
clear
%%
A = imread('Picture1.png');
%
figure, imshow(A);
%%
% alpha = -1+2*150/231+(1-2*140/231)*i;
alpha = 0.5+0*i;
setGlobalx(alpha);
%
uData = [ -1.0   1.0];  % Bounds for REAL(w)
vData = [  1.0  -1.0];  % Bounds for IMAG(w)
% 
xData = [ -1.0   1.0];  % Bounds for REAL(z)
yData = [  1.0  -1.0];  % Bounds for IMAG(z)
%%
ring = maketform('custom', 2, 2, [], @diskor, []);
Bring = imtransform( A, ring, 'cubic',...
                    'UData', uData,  'VData', vData,...
                    'XData', xData, 'YData', yData,...
                    'Size', [231 231], 'FillValues', 255 );
figure(1)
imshow(Bring); 
hold on
plot(150,140,'or','MarkerfaceColor','r')
grid on
title('Original Image');
%%
ring = maketform('custom', 2, 2, [], @mobi, []);
Bring = imtransform( A, ring, 'cubic',...
                    'UData', uData,  'VData', vData,...
                    'XData', xData, 'YData', yData,...
                    'Size', [231 231], 'FillValues', 255 );
figure, imshow(Bring); 
title('Transformed Image');
%%