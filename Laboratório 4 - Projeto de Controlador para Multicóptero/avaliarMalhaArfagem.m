function avaliarMalhaArfagem()
% avaliarMalhaArfagem() avalia o projeto da malha de arfagem.

requisitos.tr = 0.1;
requisitos.Mp = 0.05;

planta = obterPlantaMulticoptero();

controlador = projetarControladorArfagem(requisitos, planta);

malha = obterMalhaArfagem(controlador, planta);

t = 0:1e-3:0.5;

theta = step(malha, t);

figure;
hold on;
plot(t, theta, 'LineWidth', 2);

% Plots auxiliares
aux = 0:0.1:1.2;
tr_aux = ones(length(aux)) * requisitos.tr;
h3 = plot(tr_aux, aux, 'r--', 'LineWidth', 1);
aux = 0:0.1:0.5;
Mp_aux = ones(length(aux)) * requisitos.Mp;
h4 = plot(aux, 1 + Mp_aux, 'r--', 'LineWidth', 1);

grid on;
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('\theta (rad)', 'FontSize', 14);
set(gca, 'FontSize', 14);

print -dpng -r400 fig21-1.png

clear aux tr_aux Mp_aux;
end