% Script to compute starting position errors

clear all, close all, clc;

load("dataLocoVR.mat");

waypointsAS=cell2mat(struct2cell(DataArmsSwinging(1).Waypoints))';
waypointsJS=cell2mat(struct2cell(DataTrackpad(1).Waypoints))';
waypointsRW=cell2mat(struct2cell(DataRealWalking(1).Waypoints))';
waypointsTP=cell2mat(struct2cell(DataTeleport(1).Waypoints))';

spIndices=[1,5,9,13,17];
w3Indices=[4,8,12,16,20];

ActualStartAS=waypointsAS(spIndices,:);
ActualStartJS=waypointsJS(spIndices,:);
ActualStartRW=waypointsRW(spIndices,:);
ActualStartTP=waypointsTP(spIndices,:);

ActualW3AS=waypointsAS(w3Indices,:);
ActualW3JS=waypointsJS(w3Indices,:);
ActualW3RW=waypointsRW(w3Indices,:);
ActualW3TP=waypointsTP(w3Indices,:);


EstimatedStartAS=zeros(5,2,numPar);
EstimatedStartJS=zeros(5,2,numPar);
EstimatedStartRW=zeros(5,2,numPar);
EstimatedStartTP=zeros(5,2,numPar);
ErrorDistanceStartAS=zeros(numPar,5);
ErrorDistanceStartJS=zeros(numPar,5);
ErrorDistanceStartRW=zeros(numPar,5);
ErrorDistanceStartTP=zeros(numPar,5);
ErrorAngleAS=zeros(numPar,5);
ErrorAngleJS=zeros(numPar,5);
ErrorAngleRW=zeros(numPar,5);
ErrorAngleTP=zeros(numPar,5);

for i=1:numPar
    EstimatedStartAS(:,:,i)=cell2mat(struct2cell(DataArmsSwinging(i).EstimatedSP))';
    EstimatedStartJS(:,:,i)=cell2mat(struct2cell(DataTrackpad(i).EstimatedSP))';
    EstimatedStartRW(:,:,i)=cell2mat(struct2cell(DataRealWalking(i).EstimatedSP))';
    EstimatedStartTP(:,:,i)=cell2mat(struct2cell(DataTeleport(i).EstimatedSP))';
end

for j=1:numPar
    for i = 1:5
        ErrorDistanceStartAS(j,i) = sqrt((EstimatedStartAS(i,1,j) - ActualStartAS(i,1))^2 + (EstimatedStartAS(i,2,j) - ActualStartAS(i,2))^2);
        ErrorDistanceStartJS(j,i) = sqrt((EstimatedStartJS(i,1,j) - ActualStartJS(i,1))^2 + (EstimatedStartJS(i,2,j) - ActualStartJS(i,2))^2);
        ErrorDistanceStartRW(j,i) = sqrt((EstimatedStartRW(i,1,j) - ActualStartRW(i,1))^2 + (EstimatedStartRW(i,2,j) - ActualStartRW(i,2))^2);
        ErrorDistanceStartTP(j,i) = sqrt((EstimatedStartTP(i,1,j) - ActualStartTP(i,1))^2 + (EstimatedStartTP(i,2,j) - ActualStartTP(i,2))^2);

        ErrorAngleAS(j,i)=computeAngle(ActualStartAS(i,:),ActualW3AS(i,:),EstimatedStartAS(i,:,j));
        ErrorAngleJS(j,i)=computeAngle(ActualStartJS(i,:),ActualW3JS(i,:),EstimatedStartJS(i,:,j));
        ErrorAngleRW(j,i)=computeAngle(ActualStartRW(i,:),ActualW3RW(i,:),EstimatedStartRW(i,:,j));
        ErrorAngleTP(j,i)=computeAngle(ActualStartTP(i,:),ActualW3TP(i,:),EstimatedStartTP(i,:,j));
    
    end
end

ErrorStartDistanceParticipant=[mean(ErrorDistanceStartAS,2),mean(ErrorDistanceStartJS,2),mean(ErrorDistanceStartRW,2),mean(ErrorDistanceStartTP,2)];             
ErrorStartAngleParticipant=[mean(ErrorAngleAS,2),mean(ErrorAngleJS,2),mean(ErrorAngleRW,2),mean(ErrorAngleTP,2)];             

ErrorStartDistance=[mean(ErrorStartDistanceParticipant);std(ErrorStartDistanceParticipant)];
ErrorStartAngle=[mean(ErrorStartAngleParticipant);std(ErrorStartAngleParticipant)];


function [theta_degrees]=computeAngle(A,B,C)
%     A -> SP
%     B -> W3
%     C -> EstimateSP
    % Define the vectors
    BA = A - B;
    BC = C - B;
    % Calculate the dot product
    dot_product = dot(BA, BC);
    % Calculate the magnitudes
    magnitude_BA = norm(BA);
    magnitude_BC = norm(BC);
    % Calculate the cosine of the angle
    cos_theta = dot_product / (magnitude_BA * magnitude_BC);
    % Compute the angle in radians
    theta = acos(cos_theta);
    % Convert to degrees (if needed)
    theta_degrees = rad2deg(theta);
end