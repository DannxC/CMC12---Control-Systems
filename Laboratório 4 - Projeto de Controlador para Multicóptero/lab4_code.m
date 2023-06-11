disp('--------------- Starting ---------------');
% Reset
close all
clear

disp('Executing main logic...');

% Initiating Values
%planta = obterPlantaMulticoptero;
%requisitos = obterRequisitos;

disp('call Q2.1...');
% Q2.1 Projeto do Controlador de Arfagem
run('avaliarMalhaArfagem.m');
disp('Q2.1 done!');

disp('call Q2.2...');
% Q2.2 Projeto do Controlador Vertical
run('avaliarMalhaVertical.m');
disp('Q2.2 done!');

disp('call Q2.3...');
% Q2.3 Projeto do Controlador Horizontal
run('avaliarMalhaHorizontal.m');
disp('Q2.3 done!');

disp('call Q2.4...');
% Q2.4 Avalia¸c˜ao do Sistema de Controle do Multic´optero
run('avaliarMulticopteroCompleto.m');
disp('Q2.4 done!');

disp('--------------- Finishing ---------------');