10 INPUT "Digite a primeira nota: "; N1
20 INPUT "Digite a segunda nota: "; N2
30 M = (VAL(N1) + VAL(N2)) / 2

40 IF M >= 60 THEN PRINT "Aprovado direto"
50 IF M < 30 THEN PRINT "Reprovado direto"

60 IF M < 60 AND M >= 30 THEN INPUT "Digite a nota da NP3: "; N3
70 IF M < 60 AND M >= 30 THEN M = (VAL(N1) + VAL(N2) + VAL(N3)) / 3
80 IF M < 60 AND M >= 30 THEN IF M >= 50 THEN PRINT "Aprovado pela NP3" ELSE PRINT "Reprovado na NP3"
