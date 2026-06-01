% Script to plot user metric data

close all, clear all, clc;

load("dataMetrics.mat");

% Column 1: Arms Swinging
% Column 2: Joystick
% Column 3: Real Walking
% Column 4: Teleport

% Row 1: Distance Estimation Signed Error
% Row 2: Distance Estimation Absolute Error
% Row 3: Spatial Orientation Position Error
% Row 4: Spatial Orientation Angle Error
% Row 5: Path Accuracy
% Row 6: User Movement Time

%% Signed
figure;
j=1;
for i=1:4
    bar(i,MetricsMean(j,i))
    hold on;
end
for i=1:4
    errorbar(i, MetricsMean(j, i), MetricsStd(j, i), 'k', 'linestyle', 'none', 'LineWidth', 1);
    hold on;
end
ylim([-30,60])
title({'Distance Estimation','Signed Error'})
ylabel('Error (cm)')
set(gca,'XTick',[])
legend('Arms Swinging','Joystick','Real Walking','Teleport');

%% DE_AE
figure;
j=2;
for i=1:4
    bar(i,MetricsMean(j,i))
    hold on;
end
for i=1:4
    errorbar(i, MetricsMean(j, i), MetricsStd(j, i), 'k', 'linestyle', 'none', 'LineWidth', 1);
    hold on;
end
% AS-JS
line([1, 2], [110, 110], 'Color', 'k', 'LineWidth', 1.2);
text(mean([1, 2]), 110.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% AS-TP
line([1, 4], [120, 120], 'Color', 'k', 'LineWidth', 1.2);
text(mean([1, 4]), 120.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% JS-RW
line([2, 3], [100, 100], 'Color', 'k', 'LineWidth', 1.2);
text(mean([2, 3]), 100.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% RW-TP
line([3, 4], [110, 110], 'Color', 'k', 'LineWidth', 1.2);
text(mean([3, 4]), 110.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
ylim([0,130])
title({'Distance Estimation','Absolute Error'})
ylabel('Error (cm)')
set(gca,'XTick',[])
legend('Arms Swinging','Joystick','Real Walking','Teleport');

%% SP_PE
figure;
j=3;
for i=1:4
    bar(i,MetricsMean(j,i))
    hold on;
end
for i=1:4
    errorbar(i, MetricsMean(j, i), MetricsStd(j, i), 'k', 'linestyle', 'none', 'LineWidth', 1);
    hold on;
end
% AS-JS
line([1, 2], [90, 90], 'Color', 'k', 'LineWidth', 1.2);
text(mean([1, 2]), 90.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% AS-RW
line([1, 3], [102.5, 102.5], 'Color', 'k', 'LineWidth', 1.2);
text(mean([1, 3]), 103, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% AS-TP
line([1, 4], [115, 115], 'Color', 'k', 'LineWidth', 1.2);
text(mean([1, 4]), 115.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% JS-TP
line([2, 4], [127.5, 127.5], 'Color', 'k', 'LineWidth', 1.2);
text(mean([2, 4]), 128, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
ylim([0,140])
title({'Spatial Orientation','Position Error'})
ylabel('Error (cm)')
set(gca,'XTick',[])
legend('Arms Swinging','Joystick','Real Walking','Teleport');

%% SP_AE
figure;
j=4;
for i=1:4
    bar(i,MetricsMean(j,i))
    hold on;
end
for i=1:4
    errorbar(i, MetricsMean(j, i), MetricsStd(j, i), 'k', 'linestyle', 'none', 'LineWidth', 1);
    hold on;
end
% AS-TP
line([1, 4], [25, 25], 'Color', 'k', 'LineWidth', 1.2);
text(mean([1, 4]), 25.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% JS-TP
line([2, 4], [28, 28], 'Color', 'k', 'LineWidth', 1.2);
text(mean([2, 4]), 28.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% RW-TP
line([3, 4], [31, 31], 'Color', 'k', 'LineWidth', 1.2);
text(mean([3, 4]), 31.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
ylim([0,35])
title({'Spatial Orientation','Angle Error'})
ylabel(['Error (' char(176) ')'])
set(gca,'XTick',[])
legend('Arms Swinging','Joystick','Real Walking','Teleport');

%% PA_ED
figure;
j=5;
for i=1:4
    bar(i,MetricsMean(j,i))
    hold on;
end
for i=1:4
    errorbar(i, MetricsMean(j, i), MetricsStd(j, i), 'k', 'linestyle', 'none', 'LineWidth', 1);
    hold on;
end
% AS-JS
line([1, 2], [50, 50], 'Color', 'k', 'LineWidth', 1.2);
text(mean([1, 2]), 50.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% AS-RW
line([1, 3], [57.5, 57.5], 'Color', 'k', 'LineWidth', 1.2);
text(mean([1, 3]), 58, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% AS-TP
line([1, 4], [65, 65], 'Color', 'k', 'LineWidth', 1.2);
text(mean([1, 4]), 65.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
ylim([0,70])
title('Path Accuracy')
ylabel('Error (cm)')
set(gca,'XTick',[])
legend('Arms Swinging','Joystick','Real Walking','Teleport');

%% Time
figure;
j=6;
for i=1:4
    bar(i,MetricsMean(j,i))
    hold on;
end
for i=1:4
    errorbar(i, MetricsMean(j, i), MetricsStd(j, i), 'k', 'linestyle', 'none', 'LineWidth', 1);
    hold on;
end
% AS-JS
line([1, 2], [175, 175], 'Color', 'k', 'LineWidth', 1.2);
text(mean([1, 2]), 175.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% AS-TP
line([1, 4], [195, 195], 'Color', 'k', 'LineWidth', 1.2);
text(mean([1, 4]), 195.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% JS-RW
line([2, 3], [215, 215], 'Color', 'k', 'LineWidth', 1.2);
text(mean([2, 3]), 215.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
% RW-TP
line([3, 4], [175, 175], 'Color', 'k', 'LineWidth', 1.2);
text(mean([3, 4]), 175.5, '*', 'HorizontalAlignment', 'center', 'FontSize', 14);
ylim([0,230])
title({'User Movement Time'})
ylabel('Time (s)')
set(gca,'XTick',[])
legend('Arms Swinging','Joystick','Real Walking','Teleport');
