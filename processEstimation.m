% Script to compute errors in distance estimation (absolute error & percentage error)
% Remove abs for signed error
 
clear all, close all, clc;

load("dataLocoVR.mat");

VectorLengthEstimation=3*5*numPar;

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

ErrorAS=(EstimatedDistanceAS(:,:,:)-ActualDistanceAS);
ErrorJS=(EstimatedDistanceJS(:,:,:)-ActualDistanceJS);
ErrorRW=(EstimatedDistanceRW(:,:,:)-ActualDistanceRW);
ErrorTP=(EstimatedDistanceTP(:,:,:)-ActualDistanceTP);
ErrorParticipant1=zeros(numPar,4);
for j=1:numPar
    ErrorParticipant1(j,:)=[mean2(ErrorAS(:,:,j)),mean2(ErrorJS(:,:,j)),mean2(ErrorRW(:,:,j)),mean2(ErrorTP(:,:,j))];    
end
mean(abs(ErrorParticipant1))
std(abs(ErrorParticipant1))
countOver=sum(ErrorParticipant1>0)
countUnder=sum(ErrorParticipant1<0)
positive_negative_means1 = [mean(ErrorParticipant1(ErrorParticipant1(:, 1) > 0,1)),mean(ErrorParticipant1(ErrorParticipant1(:, 2) > 0,2)),mean(ErrorParticipant1(ErrorParticipant1(:, 3) > 0,3)),mean(ErrorParticipant1(ErrorParticipant1(:, 4) > 0,4));
                           mean(ErrorParticipant1(ErrorParticipant1(:, 1) < 0,1)),mean(ErrorParticipant1(ErrorParticipant1(:, 2) < 0,2)),mean(ErrorParticipant1(ErrorParticipant1(:, 3) < 0,3)),mean(ErrorParticipant1(ErrorParticipant1(:, 4) < 0,4))]

ErrorAS=((EstimatedDistanceAS(:,:,:)-ActualDistanceAS)./ActualDistanceAS);
ErrorJS=((EstimatedDistanceJS(:,:,:)-ActualDistanceJS)./ActualDistanceJS);
ErrorRW=((EstimatedDistanceRW(:,:,:)-ActualDistanceRW)./ActualDistanceRW);
ErrorTP=((EstimatedDistanceTP(:,:,:)-ActualDistanceTP)./ActualDistanceTP);
ErrorParticipant2=zeros(numPar,4);
for j=1:numPar
    ErrorParticipant2(j,:)=[mean2(ErrorAS(:,:,j)),mean2(ErrorJS(:,:,j)),mean2(ErrorRW(:,:,j)),mean2(ErrorTP(:,:,j))].*100;    
end
mean(abs(ErrorParticipant2))
std(abs(ErrorParticipant2))
countOver=sum(ErrorParticipant2>0)
countUnder=sum(ErrorParticipant2<0)
positive_negative_means2 = [mean(ErrorParticipant2(ErrorParticipant2(:, 1) > 0,1)),mean(ErrorParticipant2(ErrorParticipant2(:, 2) > 0,2)),mean(ErrorParticipant2(ErrorParticipant2(:, 3) > 0,3)),mean(ErrorParticipant2(ErrorParticipant2(:, 4) > 0,4));
                           mean(ErrorParticipant2(ErrorParticipant2(:, 1) < 0,1)),mean(ErrorParticipant2(ErrorParticipant2(:, 2) < 0,2)),mean(ErrorParticipant2(ErrorParticipant2(:, 3) < 0,3)),mean(ErrorParticipant2(ErrorParticipant2(:, 4) < 0,4))]


ParticipantAbsoluteError=abs(ErrorParticipant1);
ParticipantPercentageError=abs(ErrorParticipant2);


