function codons = getallcodons(dna)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if(strcmp(lower(dna),'dna'))
    nts = ['A' 'T' 'C' 'G'];
else
    nts = ['A' 'U' 'C' 'G'];
end
codons = {};
for i=1:4
    for j=1:4
        for k=1:4
            codons = [codons {[nts(i) nts(j) nts(k)]}];
        end
    end
end
end

