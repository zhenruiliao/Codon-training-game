function aa = getaa( D )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
AA_all = 'GAVLIPFYWSTCMNQKRHDE'; % all amino acids
idx = fromdistro(D);
aa = AA_all(idx);
end

