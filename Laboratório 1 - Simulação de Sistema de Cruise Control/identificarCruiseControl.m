function [m, b] = identificarCruiseControl(f, t, v)
% [m, b] = identificarCruiseControl(f, t, v) utiliza identificacao de
% sistemas para determinar parametros da planta do cruise control. Assume
% que foi realizado um experimento com forca constante f com o carro
% comecando em repouso. Nesse experimento, a velocidade do carro foi
% medida nos tempos t (t eh um vetor) e os resultados foram armazenados no
% vetor v. As saidas da funcao sao os parametros da planta: a massa m e o
% fator de amortecimento b.

% Implementar identificacao do cruise control

% Damping Factor
b = f/v(end);

% Mass
m = -b * t(1000) / log(1 - (b/f) * v(1000));

end