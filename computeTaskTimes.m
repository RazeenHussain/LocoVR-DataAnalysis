% Script to compute task completion times

close all, clear all, clc;

load("dataLocoVR.mat");

VectorLengthTime=numPar*15;
TimeAS=[];
TimeJS=[];
TimeRW=[];
TimeTP=[];
ParticipantTimeAS=[];
ParticipantTimeJS=[];
ParticipantTimeRW=[];
ParticipantTimeTP=[];


for i=1:numPar
   
    timesAS=reshape(cell2mat(struct2cell(DataArmsSwinging(i).TaskTime)),15,1);
    ParticipantTimeAS=[ParticipantTimeAS,sum(timesAS)];
    TimeAS=[TimeAS;timesAS];

    timesJS=reshape(cell2mat(struct2cell(DataTrackpad(i).TaskTime)),15,1);
    ParticipantTimeJS=[ParticipantTimeJS,sum(timesJS)];
    TimeJS=[TimeJS;timesJS];

    timesRW=reshape(cell2mat(struct2cell(DataRealWalking(i).TaskTime)),15,1);
    ParticipantTimeRW=[ParticipantTimeRW,sum(timesRW)];
    TimeRW=[TimeRW;timesRW];

    timesTP=reshape(cell2mat(struct2cell(DataTeleport(i).TaskTime)),15,1);
    ParticipantTimeTP=[ParticipantTimeTP,sum(timesTP)];
    TimeTP=[TimeTP;timesTP];

end

meanTime=[mean(ParticipantTimeAS);mean(ParticipantTimeJS);mean(ParticipantTimeRW);mean(ParticipantTimeTP)];
stdTime=[std(ParticipantTimeAS);std(ParticipantTimeJS);std(ParticipantTimeRW);std(ParticipantTimeTP)];

ParticipantTime=[ParticipantTimeAS;ParticipantTimeJS;ParticipantTimeRW;ParticipantTimeTP]';

% save("DataStatistical/TaskTime.mat","ParticipantTime");
