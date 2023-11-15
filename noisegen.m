function [noisehere] = noisegen(ndim,Ndays)
%NOISEGEN Summary of this function goes here
noisegen = randn(ndim,Ndays);


noisehere = [ noisegen noisegen  noisegen  noisegen  noisegen  ];


end

