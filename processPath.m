% Script to compute path accuracy

clear all, close all, clc;

load("dataLocoVR.mat");

DistanceMovedAS = zeros(5,3,numPar);
DistanceMovedJS = zeros(5,3,numPar);
DistanceMovedRW = zeros(5,3,numPar);
DistanceMovedTP = zeros(5,3,numPar);
PrecisionParticipantAS = zeros(5,3,numPar);
PrecisionParticipantJS = zeros(5,3,numPar);
PrecisionParticipantRW = zeros(5,3,numPar);
PrecisionParticipantTP = zeros(5,3,numPar);

UserMovement = struct('SP_W1',{},'W1_W2',{},'W2_W3',{});

%% Arms Swinging
for j=1:numPar
    userPosition=cell2mat(struct2cell(DataArmsSwinging(j).UserPositions))';
    indices = reshape(find(userPosition(:,3)==0),4,5)';
    for i=1:5
        UserMovement(i).SP_W1=userPosition(indices(i,1):indices(i,2),1:3);
        UserMovement(i).W1_W2=userPosition(indices(i,2):indices(i,3),1:3);
        UserMovement(i).W2_W3=userPosition(indices(i,3):indices(i,4),1:3);
        DistanceMovedAS(i,1,j)=DistanceTravelled(UserMovement(i).SP_W1);
        DistanceMovedAS(i,2,j)=DistanceTravelled(UserMovement(i).W1_W2);
        DistanceMovedAS(i,3,j)=DistanceTravelled(UserMovement(i).W2_W3);
    end
end

%% Joystick
for j=1:numPar
    
    if (j==10)
        userPosition=cell2mat(struct2cell(DataTrackpad(j).UserPositions))';
        wpIndices=find(userPosition(:,3)==0);
        indices = reshape(wpIndices(1:8),4,2)';
        for i=1:2
            UserMovement(i).SP_W1=userPosition(indices(i,1):indices(i,2),1:3);
            UserMovement(i).W1_W2=userPosition(indices(i,2):indices(i,3),1:3);
            UserMovement(i).W2_W3=userPosition(indices(i,3):indices(i,4),1:3);
            DistanceMovedJS(i,1,j)=DistanceTravelled(UserMovement(i).SP_W1);
            DistanceMovedJS(i,2,j)=DistanceTravelled(UserMovement(i).W1_W2);
            DistanceMovedJS(i,3,j)=DistanceTravelled(UserMovement(i).W2_W3);
        end
    else
        userPosition=cell2mat(struct2cell(DataTrackpad(j).UserPositions))';
        indices = reshape(find(userPosition(:,3)==0),4,5)';
        for i=1:5
            UserMovement(i).SP_W1=userPosition(indices(i,1):indices(i,2),1:3);
            UserMovement(i).W1_W2=userPosition(indices(i,2):indices(i,3),1:3);
            UserMovement(i).W2_W3=userPosition(indices(i,3):indices(i,4),1:3);
            DistanceMovedJS(i,1,j)=DistanceTravelled(UserMovement(i).SP_W1);
            DistanceMovedJS(i,2,j)=DistanceTravelled(UserMovement(i).W1_W2);
            DistanceMovedJS(i,3,j)=DistanceTravelled(UserMovement(i).W2_W3);
        end
    end
end

%% Real Walking
for j=1:numPar
    userPosition=cell2mat(struct2cell(DataRealWalking(j).UserPositions))';
    indices = reshape(find(userPosition(:,3)==0),4,5)';
    for i=1:5
        UserMovement(i).SP_W1=userPosition(indices(i,1):indices(i,2),1:3);
        UserMovement(i).W1_W2=userPosition(indices(i,2):indices(i,3),1:3);
        UserMovement(i).W2_W3=userPosition(indices(i,3):indices(i,4),1:3);
        DistanceMovedRW(i,1,j)=DistanceTravelled(UserMovement(i).SP_W1);
        DistanceMovedRW(i,2,j)=DistanceTravelled(UserMovement(i).W1_W2);
        DistanceMovedRW(i,3,j)=DistanceTravelled(UserMovement(i).W2_W3);
    end
end

%% Teleport
for j=1:numPar
    userPosition=cell2mat(struct2cell(DataTeleport(j).UserPositions))';
    indices = reshape(find(userPosition(:,3)==0),4,5)';
    for i=1:5
        UserMovement(i).SP_W1=userPosition(indices(i,1):indices(i,2),1:3);
        UserMovement(i).W1_W2=userPosition(indices(i,2):indices(i,3),1:3);
        UserMovement(i).W2_W3=userPosition(indices(i,3):indices(i,4),1:3);
        DistanceMovedTP(i,1,j)=DistanceTravelled(UserMovement(i).SP_W1);
        DistanceMovedTP(i,2,j)=DistanceTravelled(UserMovement(i).W1_W2);
        DistanceMovedTP(i,3,j)=DistanceTravelled(UserMovement(i).W2_W3);
    end
end

%% Path Precision
PrecisionParticipantActual=zeros(numPar,4);
PrecisionParticipantEstimate=zeros(numPar,4);

for j=1:numPar
    PrecisionParticipantAS(:,:,j)=DistanceMovedAS(:,:,j)-ActualDistanceAS;
    PrecisionParticipantJS(:,:,j)=DistanceMovedJS(:,:,j)-ActualDistanceJS;
    PrecisionParticipantRW(:,:,j)=DistanceMovedRW(:,:,j)-ActualDistanceRW;
    PrecisionParticipantTP(:,:,j)=DistanceMovedTP(:,:,j)-ActualDistanceTP;
end
for j=1:numPar
    PrecisionParticipantActual(j,:)=[mean2(PrecisionParticipantAS(:,:,j)),mean2(PrecisionParticipantJS(:,:,j)),mean2(PrecisionParticipantRW(:,:,j)),mean2(PrecisionParticipantTP(:,:,j))];    
end
PrecisionActual=[mean(PrecisionParticipantActual);std(PrecisionParticipantActual)];

EstimatedDistanceAS=zeros(5,3,numPar);
EstimatedDistanceJS=zeros(5,3,numPar);
EstimatedDistanceRW=zeros(5,3,numPar);
EstimatedDistanceTP=zeros(5,3,numPar);
for i=1:numPar
    EstimatedDistanceAS(:,:,i)=cell2mat(struct2cell(DataArmsSwinging(i).EstimatedDistance))';
    EstimatedDistanceJS(:,:,i)=cell2mat(struct2cell(DataTrackpad(i).EstimatedDistance))';
    EstimatedDistanceRW(:,:,i)=cell2mat(struct2cell(DataRealWalking(i).EstimatedDistance))';
    EstimatedDistanceTP(:,:,i)=cell2mat(struct2cell(DataTeleport(i).EstimatedDistance))';
end       
        
for j=1:numPar
    PrecisionParticipantAS(:,:,j)=abs(DistanceMovedAS(:,:,j)-EstimatedDistanceAS(:,:,j));
    PrecisionParticipantJS(:,:,j)=abs(DistanceMovedJS(:,:,j)-EstimatedDistanceJS(:,:,j));
    PrecisionParticipantRW(:,:,j)=abs(DistanceMovedRW(:,:,j)-EstimatedDistanceRW(:,:,j));
    PrecisionParticipantTP(:,:,j)=abs(DistanceMovedTP(:,:,j)-EstimatedDistanceTP(:,:,j));
end
for j=1:numPar
    PrecisionParticipantEstimate(j,:)=[mean2(PrecisionParticipantAS(:,:,j)),mean2(PrecisionParticipantJS(:,:,j)),mean2(PrecisionParticipantRW(:,:,j)),mean2(PrecisionParticipantTP(:,:,j))];    
end
PrecisionEstimate=[mean(PrecisionParticipantEstimate);std(PrecisionParticipantEstimate)];

function [DistanceMoved]=DistanceTravelled(points)
    DistanceMoved=0;
    for i = 1:(size(points, 1) - 1)
        % Extract consecutive points
        point1 = points(i, :);
        point2 = points(i + 1, :);
        % Calculate the Euclidean distance between the points
        distance = sqrt((point2(1) - point1(1))^2 + (point2(2) - point1(2))^2);
        % Accumulate the total distance
        DistanceMoved = DistanceMoved + distance;
    end
end

