% Obter Planta Longitudinal
plantaLongitudinal = obterPlantaLongitudinal;

% Obter as funções de transferência do controlador longitudinal
G_longitudinal = tf(plantaLongitudinal);
Gq = G_longitudinal(1);
Gtheta = G_longitudinal(2);
Gh = G_longitudinal(3);

% Obter resposta step
t = 0:0.1:3e3;
q = step(Gq, t);
theta = step(Gtheta, t);
h = step(Gh, t);

% Plots
figure;
hold on;
grid on;
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('q (crad/s)', 'FontSize', 14);
title('Resposta Degrau (q)');
set(gca, 'FontSize', 14);
plot(t, q, 'LineWidth', 2);
print -dpng -r400 step_response_q.png

figure;
hold on;
grid on;
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('theta (crad/s)', 'FontSize', 14);
title('Resposta Degrau (theta)');
set(gca, 'FontSize', 14);
plot(t, theta, 'LineWidth', 2);
print -dpng -r400 step_response_theta.png

figure;
hold on;
grid on;
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('h (crad/s)', 'FontSize', 14);
title('Resposta Degrau (h)');
set(gca, 'FontSize', 14);
plot(t, h, 'LineWidth', 2);
print -dpng -r400 step_response_h.png


% Evitar ganhos negativos, podemos considerar
Gq = -Gq;
Gtheta = -Gtheta;


% Obter ganhos (rltool) ao configurar projeto e obter a malha fechada
% Comparar as malhas aberta e fechada (plots)

% MALHA ABERTA
[x, t1] = step(Gtheta);

% MALHA FECHADA (P + V)
s = tf('s');
%rltool(Gq/s); % OBS: Gq = Gtheta * s
Ktheta = 6.9256; % obtido no rltool
Kq = Ktheta * 0.28; % obtido no rltool
Gpv = minreal(Ktheta*Gq/((1+Kq*Gq)*s + Ktheta*Gq));
[y, t2] = step(Gpv);

% Plot
figure;
hold on;
grid on;
set(gca, 'FontSize', 14);
plot(t1, x, 'LineWidth', 2);
title('Resposta Degrau (Malha Aberta)');
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('\theta (crad/s)', 'FontSize', 14);
print -dpng -r400 step_response_open_theta.png

figure;
hold on;
grid on;
set(gca, 'FontSize', 14);
plot(t2, y, 'LineWidth', 2);
title('Resposta Degrau (Malha Fechada P+V)');
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('\theta (crad/s)', 'FontSize', 14);
print -dpng -r400 step_response_PV_theta.png