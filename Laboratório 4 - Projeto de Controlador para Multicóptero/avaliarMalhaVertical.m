function avaliarMalhaVertical()
% avaliarMalhaVertical() avalia o projeto da malha vertical.

requisitos.tr = 1.0;
requisitos.Mp = 0.1;

planta = obterPlantaMulticoptero();

controladorAnalitico = projetarControladorVerticalAnalitico(requisitos, planta);
controladorBusca = projetarControladorVerticalBusca(requisitos, planta);

malhaAnalitico = obterMalhaVertical(controladorAnalitico, planta);
malhaBusca = obterMalhaVertical(controladorBusca, planta);

% Avaliar implementação do pré-filtro
avaliarPreFiltroVertical(malhaAnalitico, controladorAnalitico, requisitos);

t = 0:1e-3:5;

zAnalitico = step(malhaAnalitico, t);
zBusca = step(malhaBusca, t);

figure;
hold on;
h1 = plot(t, zAnalitico, 'LineWidth', 2);
h2 = plot(t, zBusca, 'LineWidth', 2);

% Plots auxiliares
aux = 0:0.1:1.2;
tr_aux = ones(length(aux)) * requisitos.tr;
plot(tr_aux, aux, 'r--', 'LineWidth', 1);
aux = 0:0.1:5;
Mp_aux = ones(length(aux)) * requisitos.Mp;
plot(aux, 1 + Mp_aux, 'r--', 'LineWidth', 1);

grid on;
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Z (m)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend([h1 h2], 'Analitico', 'Iterativo', 'FontSize', 14, 'Location', 'Southeast');

print -dpng -r400 fig22-2.png

clear aux tr_aux Mp_aux;

end