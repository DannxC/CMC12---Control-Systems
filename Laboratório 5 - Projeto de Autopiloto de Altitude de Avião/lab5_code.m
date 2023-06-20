disp('--------------- Starting ---------------');
% Reset
close all
clear

disp('Executing main logic...');

% Initiating Values
%planta = obterPlantaMulticoptero;
%requisitos = obterRequisitos

disp('call Q2.1...');
% Q2.1 Projeto de Controlador de Arfagem
run('q2_1.m');
disp('Q2.1 done!');

disp('call Q2.2...');
% Q2.2 Projeto de Controlador de Altitude
run('q2_2.m');
disp('Q2.2 done!');

disp('call Q2.3...');
% Q2.3 Simulação do Autopiloto Longitudinal
run('avaliarAutopilotoLongitudinal.m');
disp('Q2.3 done!');

disp('--------------- Finishing ---------------');