%{
    2.1 - Projeto do Controlador Frontal
%}

% Fecha figuras e Limpa o Workspace
close all;
clear;

% Inicializar variaveis
inicializarFrontal;

% Simulação
out = sim('frontal.slx');

% Definindo a Figure
largura = 8; % largura em polegadas
altura = 6; % altura em polegadas
f = figure('Position', [0 0 largura*100, altura*100]);

% Plot
plot(out.x.time, out.x.signals.values, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14, 'interpreter', 'latex');
ylabel('x (m)', 'FontSize', 14, 'interpreter', 'latex');
title('2.1 Projeto do Controlador Frontal', 'FontSize', 18, 'interpreter', 'latex')
grid on;
hold on;

% Salva o Plot em .png e em .eps
print -dpng -r400 'grafico_2.1.png';
print -depsc2 'grafico_2.1.eps';



%{
    2.2 - Projeto do Controlador Frontal
%}

% Fecha figuras e Limpa o Workspace
close all;
clear;

% Script para testar Controle linearizado e não linearizado
avaliarLinearidadeLateral;



%{
    2.3 - Projeto do Controlador Completo
%}

% Fecha figuras e Limpa o Workspace
close all;
clear;

% Avaliar implementação
avaliarFollowline;

% Salva os Plots em .png e em .eps

for i = 1:2
    % Selecionar a figura atual
    figure(i);
    
    % Definir os nomes dos arquivos de saída para a figura atual
    png_filename = sprintf('grafico_2.3_teste_%d.png', i);
    eps_filename = sprintf('grafico_2.3_teste_%d.eps', i);

    % Salvar a figura atual nos formatos PNG e EPS
    print('-dpng', '-r400', png_filename);
    print('-depsc2', eps_filename);
end

% Animação
animacaoFollowline(out);









