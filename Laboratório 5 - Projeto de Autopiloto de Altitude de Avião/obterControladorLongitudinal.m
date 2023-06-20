function controlador = obterControladorLongitudinal()
% controlador = obterControladorLongitudinal() retorna uma struct com os
% parametros do controlador longitudinal:
% controlador.Kph: ganho proporcional do controlador de altitude.
% controlador.Kph: ganho derivativo do controlador de altitude.
% controlador.Kph: ganho proporcional do controlador de altitude.
% controlador.Kdh: ganho proporcional do controlador de altitude.
% controlador.a: parametro a do filtro usado no termo PD.

controlador.Kph = 0.00099648;
controlador.Kdh = 0.00099648 * 0.5;
controlador.Ktheta = 6.9256;
controlador.Kq = 6.9256 * 0.28;
controlador.a = 9 * controlador.Kph / controlador.Kdh;

end