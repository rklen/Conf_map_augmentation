% image_mobius_disk_to_disk_1.m
% This is an example on how to map an image (in disk) to an image (in disk) 
% such that a point alpha (a pixel) is mapped to the origin.
% Article: Image augmentation with conformal mappings for a convolutional neural network
% Dec 7, 2022
% 
clear
%---------------------------------------
A = imread('aaa.jpg');
%---------------------------------------
A=A(30:469,131:570,:);
figure, imshow(A);
%---------------------------------------
alpha = 0.5i;
setGlobalx(alpha);
%---------------------------------------
uData = [ -1.0   1.0];  % Bounds for REAL(w)
vData = [  1.0  -1.0];  % Bounds for IMAG(w)

xData = [ -1.0   1.0];  % Bounds for REAL(z)
yData = [  1.0  -1.0];  % Bounds for IMAG(z)
%---------------------------------------
ring = maketform('custom', 2, 2, [], @diskor, []);
Bring = imtransform( A, ring, 'cubic',...
                    'UData', uData,  'VData', vData,...
                    'XData', xData, 'YData', yData,...
                    'Size', [400 400], 'FillValues', 255 );
figure, imshow(Bring); 
title('Original Image');
%---------------------------------------
ring = maketform('custom', 2, 2, [], @mobi, []);
Bring = imtransform( A, ring, 'cubic',...
                    'UData', uData,  'VData', vData,...
                    'XData', xData, 'YData', yData,...
                    'Size', [400 400], 'FillValues', 255 );
figure, imshow(Bring); 
title('Transformed Image');
%---------------------------------------
