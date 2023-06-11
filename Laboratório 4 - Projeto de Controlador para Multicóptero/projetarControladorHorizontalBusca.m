function controlador = projetarControladorHorizontalBusca(requisitosX, requisitosTheta, planta)
% controlador = projetarControladorHorizontalBusca(requisitosX,
% requisitosTheta, planta) projeta o controlador horizontal com um 
% refinamento atraves de busca em grade para um melhor atendimento aos 
% requisitos. As entradas da funcao sao as structs requisitosX, 
% requisitosTheta e planta, que contem os requisitos da malha horizontal,
% os requisitos da malha de arfagem e os parametros da planta, 
% respectivamente. requisitosX e requisitosTheta sao da forma:
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
trs = linspace(0.8 * requisitosX.tr, 1.2 * requisitosX.tr, N);
Mps = linspace(0.8 * requisitosX.Mp, 1.2 * requisitosX.Mp, N);

% Iterar sobre a grade de trs e Mps para determinar o par tr e Mp que
% melhor atende aos requisitos

% Iniciar controlador_theta apenas para usar de argumento
controladorTheta = projetarControladorArfagem(requisitosTheta, planta);

% Inicia com o controlador analítico usando os requisitos e planta
% originais e com o maior inteiro possível para J
controlador = projetarControladorHorizontalAnalitico(requisitosX, planta);
J = intmax;

% Itera sobre a grade criada
for i = 1:length(trs)
    for j = 1:length(Mps)
        % Atualiza os valores
        requisitosX_atual.tr = trs(i);
        requisitosX_atual.Mp = Mps(j);
        % Testa os valores atuais
        controladorX_atual = projetarControladorHorizontalAnalitico(requisitosX_atual, planta);
        dinamicaX_atual = obterMalhaHorizontal(controladorX_atual, controladorTheta, planta);
        info = stepinfo(dinamicaX_atual, "RiseTimeLimits", [0, 1]);
        
        % Se o J atual é menor que o J vigente, atualizamos o controlador
        J_atual = abs(1 - info.RiseTime / requisitosX.tr) + abs(1 - info.Overshoot / requisitosX.Mp);
        if J_atual < J
            J = J_atual;
            controlador = controladorX_atual;
        end
    end
end

% controlador.Kp = ...;
% controlador.Ki = ...;
% controlador.Kd = ...;

end