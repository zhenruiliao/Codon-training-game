function codoncube = makecodoncube( dna )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
dna_bases = ['A' 'T' 'C' 'G'];
rna_bases = ['A' 'U' 'C' 'G'];
if(dna)
    bases = dna_bases;
else
    bases = rna_bases;
end
codoncube = {};
for i = 1:4
    for j = 1:4
        for k = 1:4
            codoncube(i,j,k) = {[bases(k) bases(j) bases(i)]};
        end
    end
end
end

