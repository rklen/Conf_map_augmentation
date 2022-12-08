function w = map(z,alp)
% 
% 
zc    =  maps(z);
alpc  =  maps(alp);
wc    = (zc-alpc)./(1-alpc'.*zc);
w     =  mapsi(wc);
%
end