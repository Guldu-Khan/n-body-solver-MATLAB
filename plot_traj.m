close all; clear all; clc;

%% Plot trajectory with spk file

cspice_furnsh( 'G:/mice/kernels/meta.tm' )

target1  = '2065803';
target2  = 'Earth';
target3  = '4';
epoch1   = 'Jan 1 2018';
epoch2   = 'Feb 14 2022';
frame    = 'J2000';
abcorr   = 'LT';
observer = 'sun';
 
et1 = cspice_str2et( epoch1 );
et2 = cspice_str2et( epoch2 );

X1 = zeros(0);
Y1 = zeros(0);
Z1 = zeros(0);
X2 = zeros(0);
Y2 = zeros(0);
Z2 = zeros(0);
X3 = zeros(0);
Y3 = zeros(0);
Z3 = zeros(0);

for i = et1:86400:et2
    
     [ state1] = cspice_spkezr( target1, i, frame, ...
                                        abcorr, observer);
    [ state2] = cspice_spkezr( target2, i, frame, ...
                                        abcorr, observer);
    [ state3] = cspice_spkezr( target3, i, frame, ...
                                        abcorr, observer);
    
                                    
X1 = [X1 state1(1)];
Y1 = [Y1 state1(2)];
Z1 = [Z1 state1(3)];

X2 = [X2 state2(1)];
Y2 = [Y2 state2(2)];
Z2 = [Z2 state2(3)];

X3 = [X3 state3(1)];
Y3 = [Y3 state3(2)];
Z3 = [Z3 state3(3)];

end

%% Plotting

figure(1)
plot3(X1,Y1,Z1,'k');
grid on; 
hold on;
plot3(X2,Y2,Z2,'b');
plot3(X3,Y3,Z3,'g');
legend('Didymos','Earth','Mars')
title('Trajectory of Didymos along with Earth and Mars')

