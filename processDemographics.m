% Script to process demographics data and comparison questionnire data

close all, clear all, clc;

load("dataDemographics.mat");

age=[mean(ageParticipant);std(ageParticipant)];

gaming=[mean(gamingParticipant);std(gamingParticipant)];

vr=[mean(vrParticipant);std(vrParticipant)];

sizeRoom=[mean(sizeParticipant);std(sizeParticipant)];

numPar=size(sizeParticipant,1);
multiplier=[10;7.5;5;2.5];
score=choices.*multiplier;
rating=[sum(score)./numPar];
     

