function z = mapi(w,alp)
% 
% 
alpc  =  maps(alp);
wc    =  maps(w);
zc    = (wc+alpc)./(1+alpc'.*wc);
z     =  mapsi(zc);
%
end


