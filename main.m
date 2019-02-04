close all; clear all; clc

%% Preliminary constants and initial conditions

format long;

global G;
global M;
global n;


G = 1.18555535802194e-04;;          % Universal gravitation constant in Astronomical units
% M = [1, 332946, 0.012303192];             % Setting both masses - E,S,M
M = [1, 332946, 0.012303192, 8.824514400535834e-15];         % Masses - E, S, M, didymos

n = size(M,2);          % Number of bodies in the universe

time = [0 1];     % running for 1 period worth of seconds

%% Starting positions and velocities

% Mass 1 - earth
r1 = [0.219688413859974;  -0.992681371713758;    0.000046115741450];
r1dot = [   6.029597085619235;    1.335390307785086;    0.000006208523005];

% Mass 2 - sun
r2 = [0;0;0];
r2dot = [0;0;0];

% Mass 3 - Moon
r3 = [   0.217141594633249;   -0.992010543779846;    0.000260498600182 ];
r3dot = [   5.985761452336621 ;   1.131138759092728;   -0.008525510824961];

% Mass 4 - Didymos
r4 = [   0.673433607493183;   -1.279965665185581;   -0.060427127048373];
r4dot = [   3.592810586721815;    4.191198594460650;   -0.132658516143360];

r = [r1;r2;r3;r4];
rdot = [r1dot;r2dot;r3dot;r4dot];

X0 = [r;rdot];

%% Time integration loop

[t,X] = ode45('nBody',time,X0);

%% Plotting

figure();
hold on;
plot3(X(:,1),X(:,2),X(:,3));
plot3(X(:,4),X(:,5),X(:,6));
plot3(X(:,7),X(:,8),X(:,9));
plot3(X(:,10),X(:,11),X(:,12));
grid on;
grid minor;
axis equal
% plot3(X(:,10),X(:,11),X(:,12));