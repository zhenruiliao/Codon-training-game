function NT = getnt( num, dna )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if(dna)
    array = ['A' 'T' 'C' 'G'];
else
    array = ['A' 'U' 'C' 'G'];
end
NT = array(num);
end

