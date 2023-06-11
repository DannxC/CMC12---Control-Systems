function avaliarPreFiltroVertical(comPreFiltro, controlador, requisitos)
% comPreFiltro é a função de transferência já com o pré filtro
% controlador é a struct que detém as informações do controlador vertical
% que estamos avaliando... no caso:
% controlador.Kp: ganho proporcional.
% controlador.Ki: ganho integrativo.
% controlador.Kd: ganho derivativo.

Kp = controlador.Kp;
Ki = controlador.Ki;
Kd = controlador.Kd;

% Filtro utilizado
s = tf('s');
Fz = Ki / (Kd * s^2 + Kp * s + Ki);

tol = 1e-4;  % Tolerância baseada nos digitos decimais que estamos considerando (4)
semPreFiltro = minreal(comPreFiltro / Fz, tol);

% Plot para comparação
figure;
hold on;
[z, t] = step(semPreFiltro);
h1 = plot(t, z, 'LineWidth', 2);
[z, t] = step(comPreFiltro);
h2 = plot(t, z, 'LineWidth', 2);

% Plots auxiliares
aux = 0:0.1:1.2;
tr_aux = ones(length(aux)) * requisitos.tr;
h3 = plot(tr_aux, aux, 'r--', 'LineWidth', 1);
aux = 0:0.1:3.5;
Mp_aux = ones(length(aux)) * requisitos.Mp;
h4 = plot(aux, 1 + Mp_aux, 'r--', 'LineWidth', 1);

grid on;
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('Z (m)', 'FontSize', 14);
set(gca, 'FontSize', 14);
legend([h1 h2], 'Sem Pré Filtro', 'Com Pré Filtro', 'FontSize', 14, 'Location', 'Southeast');

print -dpng -r400 fig22-1.png

clear aux tr_aux Mp_aux;
    
end