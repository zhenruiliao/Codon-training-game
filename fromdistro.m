function idx = fromdistro( D )
%Generates a random index based on distribution D
% Employs the probability integral transform
cdf = cumsum(D)/sum(D);
r = rand();
idx = find(r < cdf, 1);
end

