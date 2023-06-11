function controlador = projetarControladorVerticalAnalitico(requisitos, planta)
% controlador = projetarControladorVerticalAnalitico(requisitos, planta) 
% projeta o controlador vertical de forma analitica. As entradas da 
% funcao sao as structs requisitos e planta, que contem os requisitos e os 
% parametros da planta, respectivamente. Os requisitos sao:
% requisitos.tr: tempo de subidade de 0 a 100%.
% requisitos.Mp: sobressinal.
% A planta eh dada por:
% planta.m: massa.
% planta.J: inercia.
% planta.l: distancia entre os rotores.
% planta.g: aceleracao da gravidade.
% A saida da funcao eh a struct controlador com:
% controlador.Kp: ganho proporcional.
% controlador.Ki: ganho integrativo.
% controlador.Kd: ganho derivativo.

Mp = requisitos.Mp;
tr = requisitos.tr;

m = planta.m;

xi = -log(Mp) / sqrt(pi^2 + (log(Mp))^2);
wn = (pi - acos(xi)) / (tr * sqrt(1 - xi^2));

controlador.Kd = 7 * xi * wn * m;
controlador.Kp = (1 + 10 * xi^2) * wn^2 * m;
controlador.Ki = 5 * xi * wn^3 * m;

end
