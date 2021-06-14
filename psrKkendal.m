clc
clear 
% reading table form Excel file
T = readtable('Characteristics_complexities_Ebars.xlsx');
% making a matrx from the Tabel with required columns
TT = [T.P, T.P_1, T.Age, T.B, T.S1400,...
	 T.R_LUM14,	T.EDOT, T.W50, T.W10, T.CMMEW,...
     T.D_10cm, T.D_20cm, T.D_50cm, T.kol_10cm, T.kol_20cm...
     T.kol_50cm, T.WPE_10cm, T.WPE_20cm, T.WPE_50cm];
% normalize  each column to mean=0 and sigma=1
normalizedTT = normalize(TT,1);
% r-> correlation coeficinet p-> p-value
[r, p] = corr(normalizedTT);
% pair plot for correlation matrix 
corrplot(normalizedTT,'type','Kendall','testR','on')