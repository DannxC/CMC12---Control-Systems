function controlador = projetarControladorArfagem(requisitos, planta)
% controlador = projetarControladorArfagem(requisitos, planta) projeta o
% controlador de arfagem. As entradas da funcao sao as structs requisitos e
% planta, que contem os requisitos e os parametros da planta,
% respectivamente. Os requisitos sao:
% requisitos.tr: tempo de subidade de 0 a 100%.
% requisitos.Mp: sobressinal.
% A planta eh dada por:
% planta.m: massa.
% planta.J: inercia.
% planta.l: distancia entre os rotores.
% planta.g: aceleracao da gravidade.
% A saida da funcao eh a struct controlador com:
% controlador.Kp: ganho proporcional.
% controlador.Kv: ganho de velocidade.


Mp = requisitos.Mp;
tr = requisitos.tr;

J = planta.J;

xi = -log(Mp) / sqrt(pi^2 + (log(Mp))^2);
wn = (pi - acos(xi)) / (tr * sqrt(1 - xi^2));

controlador.Kv = 2 * xi * wn* J;
controlador.Kp = wn / (2 * xi);

end