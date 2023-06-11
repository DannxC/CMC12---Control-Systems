function avaliarMulticopteroCompleto()

requisitos = obterRequisitos();
planta = obterPlantaMulticoptero();

controlador = projetarControladorMulticoptero(requisitos, planta);
for experimento = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
    fprintf('Experimento %s\n', experimento);
    simulacao = simularExperimentoMulticoptero(controlador, planta, experimento);
    tracarGraficosSimulacao(simulacao); 

    % Visualizar animação por experimento -- COMENTAR ESTA LINHA CASO NÃO
    % QUEIRA VISUALIZAR
    %fazerAnimacaoMulticoptero(simulacao, planta)
end



end