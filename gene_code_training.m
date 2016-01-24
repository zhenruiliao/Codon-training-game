right = 0;
wrong = 0;
count=0;
disp(sprintf('Welcome to the codon training game! For every codon you get right, you gain a point.\n For every codon you get wrong, you lose a point. If you get stuck, type "?" for a hint.\n Type "score" at any time to view your score.\n To quit, simply type "X" (and not "Q", which would be glutamine ;))'));
dorr = input('Would you like to play dna or rna?\n', 's');
dna = strcmp(dorr,'dna');
D = ones(1,20);
AAs = 'RHKDESTNQCGPAVILMFYW';
while(1)
    idx = fromdistro(D);
    correct = AAs(idx);
    str = aa2nt(correct, 'Alphabet',dorr);
%   correct = trans(str);
    correct_name = aminoGetName(correct);
    guess = input(['What amino acid is "', str, '"?\n'], 's');
    if(guess == '?')
        hint = [str(1:2) randnt(dna)];
        D(idx) = D(idx)*3;
        guess = input(['Hint: "', hint, '" is ', trans(hint), '\n'], 's');
    end
    if(strcmpi(guess,'score') || strcmpi(guess, 'x'))
        disp('*****************************');
        disp(['Your score is ', num2str(right-wrong), ' out of ', num2str(count), '. With the curve, that''s probably pretty good. Maybe.']);
        [dsort, ranks] = sort(D,'ascend');
        best = AAs(ranks(1:5));
        best = arrayfun(@aminoGetName,best, 'UniformOutput', 0);
        worst = AAs(ranks(end-4:end));
        worst = arrayfun(@aminoGetName,worst, 'UniformOutput', 0);
        disp('Your top 5 best AAs:');
        disp(char(best));
        disp('Your bottom 5 worst AAs:');
        disp(char(worst));
        disp('*****************************');
        if(strcmpi(guess,'x'))
            disp('Bye.');
            break
        else
            guess = input(['What amino acid is "', str, '"?\n'], 's');
    
        end
    end
    if(strcmpi(guess,correct))
        right = right+1;
        D(idx) = D(idx)/2;
        disp([correct_name(5:end-1), ' is correct! You earned a point! You have ', num2str(right-wrong), ' points']);
    else
        wrong = wrong+1;
        D(idx) = D(idx)*10;
        D(strfind(guess,D)) = D(strfind(guess,D))*4;
        disp(['Incorrect! The correct answer was ', correct, ', ', correct_name(5:end), 'You lost a point! You have ', num2str(right-wrong), ' points']);
    end
    count = count+1;
    if(mod(count,10) == 0)
        disp(['Accuracy rate: ', num2str(right/count*100), '%']);
    end
end
