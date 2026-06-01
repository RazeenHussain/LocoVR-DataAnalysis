% Script to compute actual distances between waypoints

clear all, close all, clc;

load("dataLocoVR.mat");

ActualDistanceRW=zeros(5,3);
ActualDistanceAS=zeros(5,3);
ActualDistanceJS=zeros(5,3);
ActualDistanceTP=zeros(5,3);

waypointsAS=cell2mat(struct2cell(DataArmsSwinging(1).Waypoints))';
waypointsJS=cell2mat(struct2cell(DataTrackpad(1).Waypoints))';
waypointsRW=cell2mat(struct2cell(DataRealWalking(1).Waypoints))';
waypointsTP=cell2mat(struct2cell(DataTeleport(1).Waypoints))';

waypointsAS_X = reshape(waypointsAS(:,1),4,5)';
waypointsAS_Y = reshape(waypointsAS(:,2),4,5)';
waypointsJS_X = reshape(waypointsJS(:,1),4,5)';
waypointsJS_Y = reshape(waypointsJS(:,2),4,5)';
waypointsRW_X = reshape(waypointsRW(:,1),4,5)';
waypointsRW_Y = reshape(waypointsRW(:,2),4,5)';
waypointsTP_X = reshape(waypointsTP(:,1),4,5)';
waypointsTP_Y = reshape(waypointsTP(:,2),4,5)';

for i = 1:5
    for j=1:3
        ActualDistanceAS(i,j) = sqrt((waypointsAS_X(i,j+1) - waypointsAS_X(i,j))^2 + (waypointsAS_Y(i,j+1) - waypointsAS_Y(i,j))^2);
        ActualDistanceJS(i,j) = sqrt((waypointsJS_X(i,j+1) - waypointsJS_X(i,j))^2 + (waypointsJS_Y(i,j+1) - waypointsJS_Y(i,j))^2);
        ActualDistanceRW(i,j) = sqrt((waypointsRW_X(i,j+1) - waypointsRW_X(i,j))^2 + (waypointsRW_Y(i,j+1) - waypointsRW_Y(i,j))^2);
        ActualDistanceTP(i,j) = sqrt((waypointsTP_X(i,j+1) - waypointsTP_X(i,j))^2 + (waypointsTP_Y(i,j+1) - waypointsTP_Y(i,j))^2);
    end
end

% save("actualDistance.mat","ActualDistanceAS","ActualDistanceJS","ActualDistanceRW","ActualDistanceTP")