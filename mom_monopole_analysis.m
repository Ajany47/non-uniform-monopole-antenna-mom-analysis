% ============================================================
% MOMENT METHOD ANALYSIS OF A NON-UNIFORM MONOPOLE ANTENNA
% Author: Olubunmi Adenekan
%
% Description:
% This script analyses a thin-wire monopole antenna using the
% Method of Moments (MoM). It computes:
% - Current distribution
% - Input impedance
% - Radiation pattern
%
% NOTE:
% This version is cleaned and structured for clarity and reproducibility.
% ============================================================

clc; clear; close all;

%% ------------------- USER PARAMETERS -------------------
NW = 1;      % Number of wires
NP = 25;     % Number of discretisation points
NR = 1;      % Number of radius variations

freq = 300e6;        % Frequency (Hz)
c = 3e8;             % Speed of light (m/s)
lambda = c / freq;
beta = 2*pi / lambda;

radius = 0.00337 * lambda;

%% ------------------- GEOMETRY -------------------
S = 1 / ((NP - 1) * 2);

PX = zeros(1, NP);
PY = zeros(1, NP);
PZ = zeros(1, NP);

for i = 1:NP
    PZ(i) = (i - (NP+1)/2) * S;
end

%% ------------------- SEGMENT PROPERTIES -------------------
numSegments = NP - 1;

segmentLength = zeros(1, numSegments);
segmentCenter = zeros(1, numSegments);

for i = 1:numSegments
    segmentLength(i) = abs(PZ(i+1) - PZ(i));
    segmentCenter(i) = (PZ(i+1) + PZ(i)) / 2;
end

%% ------------------- IMPEDANCE MATRIX -------------------
Z = zeros(numSegments, numSegments);

for m = 1:numSegments
    for n = 1:numSegments
        
        R = abs(segmentCenter(m) - segmentCenter(n)) + radius;
        
        if m == n
            % Self impedance approximation
            Z(m,n) = (1/(2*pi)) * log(2*segmentLength(m)/radius);
        else
            % Mutual impedance approximation
            Z(m,n) = exp(-1j*beta*R) / R;
        end
    end
end

%% ------------------- EXCITATION -------------------
V = zeros(numSegments,1);
feedPoint = round(numSegments/2);
V(feedPoint) = 1;

%% ------------------- CURRENT SOLUTION -------------------
I = Z \ V;

%% ------------------- CURRENT DISTRIBUTION -------------------
figure;
plot(segmentCenter, abs(I), 'LineWidth', 2);
grid on;
title('Current Distribution Along Monopole Antenna');
xlabel('Antenna Length (m)');
ylabel('Current Magnitude (A)');

%% ------------------- INPUT IMPEDANCE -------------------
Zin = V(feedPoint) / I(feedPoint);

fprintf('\nInput Impedance:\n');
fprintf('Zin = %.4f + j%.4f Ohms\n', real(Zin), imag(Zin));

%% ------------------- RADIATION PATTERN -------------------
theta = linspace(0, 2*pi, 360);
E_theta = zeros(size(theta));

for k = 1:length(theta)
    
    sumField = 0;
    
    for n = 1:numSegments
        phase = beta * segmentCenter(n) * cos(theta(k));
        sumField = sumField + I(n) * exp(1j * phase);
    end
    
    E_theta(k) = abs(sumField);
end

figure;
polarplot(theta, E_theta, 'LineWidth', 2);
title('Radiation Pattern of Monopole Antenna');

%% ------------------- POWER CALCULATION -------------------
Pin = 0.5 * real(Zin) * abs(I(feedPoint))^2;

fprintf('\nInput Power: %.6f W\n', Pin);