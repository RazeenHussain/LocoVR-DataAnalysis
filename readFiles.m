% Script to read the experimental session files and extract relevant data

clear all, close all, clc;

%% File Read
numPar=27;
userID=1:numPar;
DataFolderPath="Data/";
for i=1:numPar
    FileArmsSwinging(i)=DataFolderPath+"ArmsSwining_"+sprintf('%02d',userID(i))+".json";
    FileRealWalking(i)=DataFolderPath+"RealWalking_"+sprintf('%02d',userID(i))+".json";
    FileTeleport(i)=DataFolderPath+"Teleport_"+sprintf('%02d',userID(i))+".json";
    FileTrackpad(i)=DataFolderPath+"Trackpad_"+sprintf('%02d',userID(i))+".json";

    txt = fileread(FileArmsSwinging(i));
    DataArmsSwinging(i)=jsondecode(txt);
    txt = fileread(FileRealWalking(i));
    DataRealWalking(i)=jsondecode(txt);
    txt = fileread(FileTeleport(i));
    DataTeleport(i)=jsondecode(txt);
    txt = fileread(FileTrackpad(i));
    DataTrackpad(i)=jsondecode(txt);
end

%% Compute Actual
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

%% Save Data
save("dataLocoVR.mat","DataArmsSwinging","DataRealWalking","DataTeleport","DataTrackpad","numPar","ActualDistanceAS","ActualDistanceJS","ActualDistanceRW","ActualDistanceTP");
