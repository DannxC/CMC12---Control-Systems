disp('--------------- Starting ---------------');
% Reset
close all
clear

disp('Executing main logic...');

obterPlantaServo;

disp('call Q2.1...');
% Q2.1
run('avaliarControladorPFeedforward.m');
disp('Q2.1 done!');

disp('call Q2.2...');
% Q2.2
run('avaliarControladorPI.m');
run('avaliarTempoSubida.m');
disp('Q2.2 done!');

disp('call Q2.3...');
% Q2.3
run('avaliarIndutor.m');
disp('Q2.3 done!');

disp('call Q3...');
% Q3
run('avaliarControladorDiscreto.m');
disp('Q3 done!');

disp('call Q4...');
% Q4
run('avaliarAntiwindup.m');
disp('Q4 done!');

disp('--------------- Finishing ---------------');