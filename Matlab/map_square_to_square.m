% map_square_to_square.m
% This is an example on how to map a square to a square such that a point
% alpha is mapped to the origin.
% Article: Image augmentation with conformal mappings for a convolutional neural network
% Dec 7, 2022
% 
clear all
%
%%
alpha    = 0.25i;
%%
[xv,yv]  = meshgrid(linspace(-0.999,0.999,21),linspace(-0.999,0.999,4001));
zv       = xv+i*yv;
%
zvi      =  zv;
zvi      =  zvi(:).';
wvi      =  map(zvi,alpha);
errorv   =  norm(abs(mapi(map(zvi,alpha),alpha)-zvi),inf)
%%
[xh,yh] =  meshgrid(linspace(-0.999,0.999,4001),linspace(-0.999,0.999,21));
zh      =  xh+i*yh;
%
zhi     =  zh;
zhi     =  zhi(:).';
whi     =  map(zhi,alpha);
errorh  =  norm(abs(mapi(map(zhi,alpha),alpha)-zhi),inf)
%%
figure;
hold on; 
plot(real(zvi),imag(zvi),'.r','MarkerSize',2);
plot(real(zhi),imag(zhi),'.b','MarkerSize',2);
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
box on
axis([-1.1 1.1 -1.1 1.1])
set(gcf,'Renderer','zbuffer')
print -depsc -r2000 fig1
%%
figure;
hold on; box on
plot(real(wvi),imag(wvi),'.r','MarkerSize',2);
plot(real(whi),imag(whi),'.b','MarkerSize',2);
set(gca,'FontSize',18)
set(gca,'LooseInset',get(gca,'TightInset'))
axis equal
box on
axis([-1.1 1.1 -1.1 1.1])
set(gcf,'Renderer','zbuffer')
print -depsc -r2000 fig2
%%