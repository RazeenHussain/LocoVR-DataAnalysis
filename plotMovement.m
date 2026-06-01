% Script to plot user trajectory

clear all, close all, clc;

load("dataLocoVR.mat");

colorSP="#EDB120";
colorW1="#FF0000";
colorW2="#0000FF";
colorW3="#FF00FF";
colorES="#77AC30";
colorSPW1="#D95319";
colorW1W2="#0072BD";
colorW2W3="#7E2F8E";
lineFactor=2;

j=27; % set participant number
type=2; % set waypoint sequence

yy=[-3,5];
xx=[-2.5,2.5];

waypointsAS=cell2mat(struct2cell(DataArmsSwinging(1).Waypoints))';
waypointsJS=cell2mat(struct2cell(DataTrackpad(1).Waypoints))';
waypointsRW=cell2mat(struct2cell(DataRealWalking(1).Waypoints))';
waypointsTP=cell2mat(struct2cell(DataTeleport(1).Waypoints))';
if (type==1)
    waypoints=waypointsAS;
elseif (type==2)
    waypoints=waypointsJS;
elseif (type==3)
    waypoints=waypointsRW;
elseif (type==4)
    waypoints=waypointsTP;
end
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
if (type==1)
    i=1;
elseif (type==2)
    i=3;
elseif (type==3)
    i=5;
elseif (type==4)
    i=2;
end
userPosition=cell2mat(struct2cell(DataArmsSwinging(j).UserPositions))';
indices = reshape(find(userPosition(:,3)==0),4,5)';
UserMovement(i).SP_W1=userPosition(indices(i,1):indices(i,2),1:3);
UserMovement(i).W1_W2=userPosition(indices(i,2):indices(i,3),1:3);
UserMovement(i).W2_W3=userPosition(indices(i,3):indices(i,4),1:3);
figure,subplot(1,4,1)
ylim(yy)
xlim(xx)
hold on
plot(userPosition(indices(i,1):indices(i,2),2),userPosition(indices(i,1):indices(i,2),1),"Color",colorSPW1,'LineWidth',lineFactor)
hold on
plot(userPosition(indices(i,2):indices(i,3),2),userPosition(indices(i,2):indices(i,3),1),"Color",colorW1W2,'LineWidth',lineFactor)
hold on
plot(userPosition(indices(i,3):indices(i,4),2),userPosition(indices(i,3):indices(i,4),1),"Color",colorW2W3,'LineWidth',lineFactor)
hold on,plot(waypoints(1,2),waypoints(1,1),'o',"MarkerFaceColor",colorSP,"MarkerEdgeColor",colorSP)
hold on,plot(waypoints(2,2),waypoints(2,1),'o',"MarkerFaceColor",colorW1,"MarkerEdgeColor",colorW1)
hold on,plot(waypoints(3,2),waypoints(3,1),'o',"MarkerFaceColor",colorW2,"MarkerEdgeColor",colorW2)
hold on,plot(waypoints(4,2),waypoints(4,1),'o',"MarkerFaceColor",colorW3,"MarkerEdgeColor",colorW3)
hold on,plot(DataArmsSwinging(j).EstimatedSP(i).y,DataArmsSwinging(j).EstimatedSP(i).x,'o',"MarkerFaceColor",colorES,"MarkerEdgeColor",colorES)
xlabel('Z (m)')
ylabel('X (m)')
title('Arms Swinging')
legend('','','','Starting Point','Waypoint 1','Waypoint 2','Waypoint 3','Estimated Starting Point')    
box on
    
%% Joystick
if (type==1)
    i=5;
elseif (type==2)
    i=1;
elseif (type==3)
    i=2;
elseif (type==4)
    i=4;
end    
userPosition=cell2mat(struct2cell(DataTrackpad(j).UserPositions))';
indices = reshape(find(userPosition(:,3)==0),4,5)';
UserMovement(i).SP_W1=userPosition(indices(i,1):indices(i,2),1:3);
UserMovement(i).W1_W2=userPosition(indices(i,2):indices(i,3),1:3);
UserMovement(i).W2_W3=userPosition(indices(i,3):indices(i,4),1:3);
subplot(1,4,2)
ylim(yy)
xlim(xx)
hold on
plot(userPosition(indices(i,1):indices(i,2),2),userPosition(indices(i,1):indices(i,2),1),"Color",colorSPW1,'LineWidth',lineFactor)
hold on
plot(userPosition(indices(i,2):indices(i,3),2),userPosition(indices(i,2):indices(i,3),1),"Color",colorW1W2,'LineWidth',lineFactor)
hold on
plot(userPosition(indices(i,3):indices(i,4),2),userPosition(indices(i,3):indices(i,4),1),"Color",colorW2W3,'LineWidth',lineFactor)
hold on,plot(waypoints(1,2),waypoints(1,1),'o',"MarkerFaceColor",colorSP,"MarkerEdgeColor",colorSP)
hold on,plot(waypoints(2,2),waypoints(2,1),'o',"MarkerFaceColor",colorW1,"MarkerEdgeColor",colorW1)
hold on,plot(waypoints(3,2),waypoints(3,1),'o',"MarkerFaceColor",colorW2,"MarkerEdgeColor",colorW2)
hold on,plot(waypoints(4,2),waypoints(4,1),'o',"MarkerFaceColor",colorW3,"MarkerEdgeColor",colorW3)
hold on,plot(DataTrackpad(j).EstimatedSP(i).y,DataTrackpad(j).EstimatedSP(i).x,'o',"MarkerFaceColor",colorES,"MarkerEdgeColor",colorES)
xlabel('Z (m)')
ylabel('X (m)')
title('Joystick')
legend('','','','Starting Point','Waypoint 1','Waypoint 2','Waypoint 3','Estimated Starting Point')    
box on
    
%% Real Walking
if (type==1)
    i=2;
elseif (type==2)
    i=4;
elseif (type==3)
    i=1;
elseif (type==4)
    i=3;
end
userPosition=cell2mat(struct2cell(DataRealWalking(j).UserPositions))';
indices = reshape(find(userPosition(:,3)==0),4,5)';
UserMovement(i).SP_W1=userPosition(indices(i,1):indices(i,2),1:3);
UserMovement(i).W1_W2=userPosition(indices(i,2):indices(i,3),1:3);
UserMovement(i).W2_W3=userPosition(indices(i,3):indices(i,4),1:3);
subplot(1,4,3)
ylim(yy)
xlim(xx)
hold on
plot(userPosition(indices(i,1):indices(i,2),2),userPosition(indices(i,1):indices(i,2),1),"Color",colorSPW1,'LineWidth',lineFactor)
hold on
plot(userPosition(indices(i,2):indices(i,3),2),userPosition(indices(i,2):indices(i,3),1),"Color",colorW1W2,'LineWidth',lineFactor)
hold on
plot(userPosition(indices(i,3):indices(i,4),2),userPosition(indices(i,3):indices(i,4),1),"Color",colorW2W3,'LineWidth',lineFactor)
hold on,plot(waypoints(1,2),waypoints(1,1),'o',"MarkerFaceColor",colorSP,"MarkerEdgeColor",colorSP)
hold on,plot(waypoints(2,2),waypoints(2,1),'o',"MarkerFaceColor",colorW1,"MarkerEdgeColor",colorW1)
hold on,plot(waypoints(3,2),waypoints(3,1),'o',"MarkerFaceColor",colorW2,"MarkerEdgeColor",colorW2)
hold on,plot(waypoints(4,2),waypoints(4,1),'o',"MarkerFaceColor",colorW3,"MarkerEdgeColor",colorW3)
hold on,plot(DataRealWalking(j).EstimatedSP(i).y,DataRealWalking(j).EstimatedSP(i).x,'o',"MarkerFaceColor",colorES,"MarkerEdgeColor",colorES)
xlabel('Z (m)')
ylabel('X (m)')
title('Real Walking')
legend('','','','Starting Point','Waypoint 1','Waypoint 2','Waypoint 3','Estimated Starting Point')    
box on
    
%% Teleport
if (type==1)
    i=3;
elseif (type==2)
    i=5;
elseif (type==3)
    i=4;
elseif (type==4)
    i=1;
end
userPosition=cell2mat(struct2cell(DataTeleport(j).UserPositions))';
indices = reshape(find(userPosition(:,3)==0),4,5)';
UserMovement(i).SP_W1=userPosition(indices(i,1):indices(i,2),1:3);
UserMovement(i).W1_W2=userPosition(indices(i,2):indices(i,3),1:3);
UserMovement(i).W2_W3=userPosition(indices(i,3):indices(i,4),1:3);
subplot(1,4,4)
ylim(yy)
xlim(xx)
hold on
plot(userPosition(indices(i,1):indices(i,2),2),userPosition(indices(i,1):indices(i,2),1),"Color",colorSPW1,'LineWidth',lineFactor)
hold on
plot(userPosition(indices(i,2):indices(i,3),2),userPosition(indices(i,2):indices(i,3),1),"Color",colorW1W2,'LineWidth',lineFactor)
hold on
plot(userPosition(indices(i,3):indices(i,4),2),userPosition(indices(i,3):indices(i,4),1),"Color",colorW2W3,'LineWidth',lineFactor)
hold on,plot(waypoints(1,2),waypoints(1,1),'o',"MarkerFaceColor",colorSP,"MarkerEdgeColor",colorSP)
hold on,plot(waypoints(2,2),waypoints(2,1),'o',"MarkerFaceColor",colorW1,"MarkerEdgeColor",colorW1)
hold on,plot(waypoints(3,2),waypoints(3,1),'o',"MarkerFaceColor",colorW2,"MarkerEdgeColor",colorW2)
hold on,plot(waypoints(4,2),waypoints(4,1),'o',"MarkerFaceColor",colorW3,"MarkerEdgeColor",colorW3)
hold on,plot(DataTeleport(j).EstimatedSP(i).y,DataTeleport(j).EstimatedSP(i).x,'o',"MarkerFaceColor",colorES,"MarkerEdgeColor",colorES)
xlabel('Z (m)')
ylabel('X (m)')
title('Teleport')
legend('','','','Starting Point','Waypoint 1','Waypoint 2','Waypoint 3','Estimated Starting Point')    
box on
set(gcf,'units','normalized','outerposition',[0 0 1 1])
