function avaliarMalhaHorizontal()
% avaliarMalhaHorizontal() avalia o projeto da malha horizontal.

requisitos.x.tr = 1.0;
requisitos.x.Mp = 0.1;
requisitos.z.tr = 1.0;
requisitos.z.Mp = 0.1;
requisitos.theta.tr = 0.1;
requisitos.theta.Mp = 0.05;

planta = obterPlantaMulticoptero();



controladorXAnalitico = projetarControladorHorizontalAnalitico(requisitos.x, planta);
controladorXIterativo = projetarControladorHorizontalBusca(requisitos.x, requisitos.theta, planta);

controladorTheta = projetarControladorArfagem(requisitos.theta, planta);

malhaAnalitico = obterMalhaHorizontal(controladorXAnalitico, controladorTheta, planta);
malhaBusca = obterMalhaHorizontal(controladorXIterativo, controladorTheta, planta);

t = 0:1e-3:5;

xAnalitico = step(malhaAnalitico, t);
xIterativo = step(malhaBusca, t);

figure;
hold on;
h1 = plot(t, xAnalitico, 'LineWidth', 2);
h2 = plot(t, xIterativo, 'LineWidth', 2);

% Plots auxiliares
aux = 0:0.1:1.2;
tr_aux = ones(length(aux)) * requisitos.x.tr;
plot(tr_aux, aux, 'r--', 'LineWidth', 1);
aux = 0:0.1:5;
Mp_aux = ones(length(aux)) * requisitos.x.Mp;
plot(aux, 1 + Mp_aux, 'r--', 'LineWidth', 1);

grid on;
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('X (m)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend([h1 h2], 'Analitico', 'Iterativo', 'FontSize', 14, 'Location', 'Southeast');

print -dpng -r400 fig23-1.png

clear aux tr_aux Mp_aux;

end