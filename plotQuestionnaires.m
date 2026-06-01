% Script to plot Questionnaire data

close all, clear all, clc;

load("dataQuestionnaires.mat");

numPar=27;

%% SUS
figure;
for i=1:4
    bar(i,SUSscore(1,i))
    hold on;
end
for i=1:4
    errorbar(i, SUSscore(1,i), SUSscore(2,i), 'k', 'linestyle', 'none', 'LineWidth', 1);
    hold on;
end
% AS-JS
line([1, 2], [100, 100], 'Color', 'k', 'LineWidth', 1.2);
text(mean([1, 2]), 100.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% AS-RW
line([1, 3], [110, 110], 'Color', 'k', 'LineWidth', 1.2);
text(mean([1, 3]), 110.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
ylim([0,130])
set(gca,'XTick',[])
legend('Arms Swinging','Joystick','Real Walking','Teleport');
title('System Usability Scale');
ylabel('Mean Usability Score')

%% TLX
figure,bar(TLXmean');
set(gca,'xticklabel',{'Mental Demand','Physical Demand','Temporal Demand','Performance','Effort','Frustration','Raw NASA TLX'})
hold on
ngroups = size(TLXstd', 1);
nbars = size(TLXstd', 2);
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, TLXmean(i,:), TLXstd(i,:), '.k', 'MarkerSize',0.1);
end
hold on,
for i = 1:nbars
    x(i,:) = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
end
% Y - AS-JS
line([x(1,2),x(2,2)], [60, 60], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,2),x(2,2)]), 60.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% Y - AS-TP
line([x(1,2),x(4,2)], [65, 65], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,2),x(4,2)]), 65.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% Y - JS-RW
line([x(2,2),x(3,2)], [70, 70], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(2,2),x(3,2)]), 70.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% Y - JS-TP
line([x(2,2),x(4,2)], [75, 75], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(2,2),x(4,2)]), 75.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% Y - RW-TP
line([x(3,2),x(4,2)], [60, 60], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(3,2),x(4,2)]), 60.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% T - AS-RW
line([x(1,3),x(3,3)], [60, 60], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,3),x(3,3)]), 60.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% T - AS-TP
line([x(1,3),x(4,3)], [65, 65], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,3),x(4,3)]), 65.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% T - JS-RW
line([x(2,3),x(3,3)], [70, 70], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(2,3),x(3,3)]), 70.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% T - JS-TP
line([x(2,3),x(4,3)], [75, 75], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(2,3),x(4,3)]), 75.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% P - JS-RW
line([x(2,4),x(3,4)], [70, 70], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(2,4),x(3,4)]), 70.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% F - AS-JS
line([x(1,6),x(2,6)], [55, 55], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,6),x(2,6)]), 55.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% F - AS-RW
line([x(1,6),x(3,6)], [60, 60], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,6),x(3,6)]), 60.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% F - RW-TP
line([x(3,6),x(4,6)], [55, 55], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(3,6),x(4,6)]), 55.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% R - AS-RW
line([x(1,7),x(3,7)], [60, 60], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,7),x(3,7)]), 60.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% R - AS-TP
line([x(1,7),x(4,7)], [55, 55], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,7),x(4,7)]), 55.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
legend('Arms Swinging','Joystick','Real Walking','Teleport');
title('NASA Task Load Index');
ylabel('Mean TLX Score')
ylim([0,100])

%% SSQ
figure,bar(SSQmean');
set(gca,'xticklabel',{'Nausea','Oculomotor','Disorientation','Total Score'})
hold on
ngroups = size(SSQstd', 1);
nbars = size(SSQstd', 2);
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, SSQmean(i,:), SSQstd(i,:), '.k', 'MarkerSize',0.1);
end
hold on,
for i = 1:nbars
    x(i,:) = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
end
% N - AS-RW
line([x(1,1),x(3,1)], [50, 50], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,1),x(3,1)]), 50.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% N - AS-TP
line([x(1,1),x(4,1)], [55, 55], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,1),x(4,1)]), 55.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% O - AS-RW
line([x(1,2),x(3,2)], [55, 55], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,2),x(3,2)]), 55.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% O - AS-TP
line([x(1,2),x(4,2)], [60, 60], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,2),x(4,2)]), 60.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% O - JS-RW
line([x(2,2),x(3,2)], [65, 65], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(2,2),x(3,2)]), 65.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% O - JS-TP
line([x(2,2),x(4,2)], [70, 70], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(2,2),x(4,2)]), 70.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% D - AS-RW
line([x(1,3),x(3,3)], [70, 70], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,3),x(3,3)]), 70.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% D - JS-RW
line([x(2,3),x(3,3)], [75, 75], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(2,3),x(3,3)]), 75.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% D - RW-TP
line([x(3,3),x(4,3)], [80, 80], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(3,3),x(4,3)]), 80.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% T - AS-RW
line([x(1,4),x(3,4)], [70, 70], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,4),x(3,4)]), 70.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% T - JS-RW
line([x(2,4),x(3,4)], [75, 75], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(2,4),x(3,4)]), 75.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
legend('Arms Swinging','Joystick','Real Walking','Teleport');
title('Simulator Sickness Questionnaire');
ylabel('Mean SSQ Score')
ylim([0,90])

%% IPQ
figure,bar(IPQmean');
set(gca,'xticklabel',{'General','Spatial Presence','Involvement','Realism'})
hold on
ngroups = size(IPQstd', 1);
nbars = size(IPQstd', 2);
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, IPQmean(i,:), IPQstd(i,:), '.k', 'MarkerSize',0.1);
end
hold on,
for i = 1:nbars
    x(i,:) = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
end
% G - AS-RW
line([x(1,1),x(3,1)], [5.5, 5.5], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,1),x(3,1)]), 5.55, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% G - JS-RW
line([x(2,1),x(3,1)], [5.9, 5.9], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(2,1),x(3,1)]), 5.95, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% G - RW-TP
line([x(3,1),x(4,1)], [6.3, 6.3], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(3,1),x(4,1)]), 6.35, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% S - AS-RW
line([x(1,2),x(3,2)], [5.5, 5.5], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,2),x(3,2)]), 5.55, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% S - RW-TP
line([x(3,2),x(4,2)], [5.9, 5.9], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(3,2),x(4,2)]), 5.95, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% R - AS-RW
line([x(1,4),x(3,4)], [4.1, 4.1], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(1,4),x(3,4)]), 4.15, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% R - JS-RW
line([x(2,4),x(3,4)], [4.5, 4.5], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(2,4),x(3,4)]), 4.55, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% R - RW-TP
line([x(3,4),x(4,4)], [4.9, 4.9], 'Color', 'k', 'LineWidth', 1.2);
text(mean([x(3,4),x(4,4)]), 4.95, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
legend('Arms Swinging','Joystick','Real Walking','Teleport');
title('Igroup Presence Questionnaire');
ylabel('Mean IPQ Score')
ylim([0,7])
