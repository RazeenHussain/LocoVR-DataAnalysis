% Repeated-measures ANOVA + Mauchly test + Bonferroni post-hoc
% Data format: rows = participants, columns = 4 conditions
% Replace data vraible with the required metric data

clear all, clc, close all;

load('dataParticipants.mat');
numPar = 27;

%% Convert to table for fitrm
T = array2table(data, ...
    'VariableNames', {'AS','JS','RW','TP'});

%% Define repeated-measures model
rm = fitrm(T, 'AS-TP ~ 1', 'WithinDesign', ...
           table({'AS';'JS';'RW';'TP'}, 'VariableNames', {'Condition'}));

%% Run repeated-measures ANOVA
ranovatbl = ranova(rm, 'WithinModel', 'Condition');
disp('--- Repeated-measures ANOVA ---');
disp(ranovatbl);

%% Extract and display Mauchly’s test of sphericity
mauchlyTbl = mauchly(rm);
disp('--- Mauchly''s Test of Sphericity ---');
disp(mauchlyTbl);

%% If sphericity violated, show corrections
epsilonTbl = epsilon(rm);
disp('--- Greenhouse-Geisser / Huynh-Feldt Corrections ---');
disp(epsilonTbl);

%%  Post-hoc pairwise comparisons (Bonferroni corrected)
posthoc = multcompare(rm, 'Condition', 'ComparisonType', 'bonferroni');

disp('--- Bonferroni-corrected Post-hoc Comparisons ---');
disp(posthoc);
