% Obter Planta Altitude
plantaAltitude = obterPlantaAltitude;

% Obter as funções de transferência do controlador altitude (Malha Aberta)
Gh = tf(plantaAltitude);
%rltool(Gh);
Kph = 0.00099648; % Obtido com rltool
Kdh = Kph * 0.5; % Obtido com rltool

% Controlador
s = tf('s');
Ch = Kph + Kdh * s;

% Função de Transferência em malha fechada (PD)
Ghpd = Ch * Gh / (1 + Ch * Gh);

% Resposta em degrau da função de transferência do controlador
[z, t3] = step(Ghpd);


% Plot
figure;
hold on;
grid on;

% Plot Auxiliar (verificar tempo de subida e sobressinal)
%aux = 0:0.1:1.2;
%tr_aux = ones(length(aux)) * 3;
%h3 = plot(tr_aux, aux, 'b--', 'LineWidth', 1);
%tr_aux = ones(length(aux)) * 4;
%h4 = plot(tr_aux, aux, 'b--', 'LineWidth', 1);
h3 = line([3 3], [0 1.2], 'Color', 'b', 'LineStyle', '--', 'LineWidth', 1);
h4 = line([4 4], [0 1.2], 'Color', 'b', 'LineStyle', '--', 'LineWidth', 1);

h5 = line([0 15], [1.2 1.2], 'Color', 'r', 'LineStyle', '--', 'LineWidth', 1);
%aux = 0:0.1:15;
%Mp_aux = ones(length(aux)) * 0.2;
%h5 = plot(aux, 1 + Mp_aux, 'r--', 'LineWidth', 1);


set(gca, 'FontSize', 14);
plot(t3, z, 'LineWidth', 2);
title('Resposta Degrau (Malha Aberta)');
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('h (crad/s)', 'FontSize', 14);
disp(size(h3));
disp(size(h4));
disp(size(h5));
legend([h3 h4 h5], {'ts > 3s', 'ts < 4s', 'Mp < 0.2'}, 'FontSize', 14, 'Location', 'Southeast');

print -dpng -r400 step_response_h_pd.png
