function dinamica = obterMalhaHorizontal(controladorX, controladorTheta, planta)
% dinamica = obterMalhaHorizontal(controladorX, controladorTheta, planta)
% obtem a dinamica da malha horizontal. As structs controladorX e 
% controladorTheta possuem a seguinte estrutura:
% controladorX.Kp: ganho proporcional.
% controladorX.Ki: ganho integrativo.
% controladorX.Kd: ganho derivativo.
%controladorTheta.Kv
%controladorTheta.Kp
% A struct planta tem os seguintes parametros:
% planta.m: massa.
% planta.J: inercia.
% planta.l: distancia entre os rotores.
% planta.g: aceleracao da gravidade.
% A saida dinamica eh a dinamica da malha horizontal na forma de funcao de
% transferencia.

Kp_x = controladorX.Kp;
Ki_x = controladorX.Ki;
Kd_x = controladorX.Kd;

Kp_t = controladorTheta.Kp;
Kv_t = controladorTheta.Kv;

J = planta.J;
g = planta.g;

s = tf('s');

% Com pré-filtro aplicado!!
dinamica = (g * Ki_x * Kp_t * Kv_t) / (s^3 * (J * s^2 + Kv_t * s + Kp_t * Kv_t) + g * (Kd_x * s^2 + Kp_x * s + Ki_x) * Kp_t * Kv_t);

end