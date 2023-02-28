%% Code Information
%*************************************************************************
%Michael Dacus                                                      EE 133

%Function Description: Evaluate the input Received Power (in dBm) based
%using Friis' formula for a variety of transmitted power 

%Input: 
    %Transmitted power:[150,250][W]
    %Assume G_t=1
%Output:
    %Plot of input available power [dBm] to distance from aircraft [m]

%************************************************************************
clear
clc
close all

%% Define parameters
%Gain of Antennas
G_r=5;
G_t=1;
%Wavelength of 1090mhz signal
gamma=0.275;
%Input transmitted power
P_t=linspace(150,250,3);

%% Generate Plots
for i=1:numel(P_t)
    fplot(@(R)Friis(R,P_t(i),G_r,G_t,gamma),[0, 20]);
    hold on
end

%formatting properties
grid on
xlabel('Distance to Aircraft (R) [mi]')
ylabel('Input Available Power (P_{in}) [dBm]')
leg=legend(strsplit(num2str(P_t)));
title(leg,'Transmitted Power [W]')
hold off

%% Other Functions
%Friis Equation
function [P_r_dBm]=Friis(R,P_t,G_r,G_t,gamma)
    R_m=1609.34*R;
    P_r=(P_t*G_t*G_r*gamma^2)/(4*pi*R_m)^2;
    P_r_dBm=10*log10(P_r)+30;
end