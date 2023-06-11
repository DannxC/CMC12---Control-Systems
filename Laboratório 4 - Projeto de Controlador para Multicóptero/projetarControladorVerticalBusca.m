function controlador = projetarControladorVerticalBusca(requisitos, planta)
% controlador = projetarControladorVerticalBusca(requisitos, planta) 
% projeta o controlador vertical com um refinamento atraves de busca em 
% grade para um melhor atendimento aos requisitos. As entradas da funcao 
% sao as structs requisitos e planta, que contem os requisitos e os 
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

% Numero de valores de cada parametro usados na grade
N = 20;

% Gerando os valores na grade
trs = linspace(0.8 * requisitos.tr, 1.2 * requisitos.tr, N);
Mps = linspace(0.8 * requisitos.Mp, 1.2 * requisitos.Mp, N);

% Iterar sobre a grade de trs e Mps para determinar o par tr e Mp que
% melhor atende aos requisitos

% Inicia com o controlador analítico usando os requisitos e planta
% originais e com o maior inteiro possível para J
controlador = projetarControladorVerticalAnalitico(requisitos, planta);
J = intmax;

% Itera sobre a grade criada
for i = 1:length(trs)
    for j = 1:length(Mps)
        % Atualiza os valores
        requisitos_atual.tr = trs(i);
        requisitos_atual.Mp = Mps(j);
        % Testa os valores atuais
        controlador_atual = projetarControladorVerticalAnalitico(requisitos_atual, planta);
        dinamica_atual = obterMalhaVertical(controlador_atual, planta);
        info = stepinfo(dinamica_atual, "RiseTimeLimits", [0, 1]);
        
        % Se o J atual é menor que o J vigente, atualizamos o controlador
        J_atual = abs(1 - info.RiseTime / requisitos.tr) + abs(1 - info.Overshoot / requisitos.Mp);
        if J_atual < J
            J = J_atual;
            controlador = controlador_atual;
        end
    end
end

% controlador.Kp = ...;
% controlador.Ki = ...;
% controlador.Kd = ...;

end