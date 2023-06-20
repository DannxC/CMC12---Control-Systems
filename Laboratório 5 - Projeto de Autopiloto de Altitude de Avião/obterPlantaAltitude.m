function planta = obterPlantaAltitude()
% planta = obterPlantaAltitude() obtem a planta de altitude na forma
% de espaco de estados. A planta eh um objeto gerado pela funcao ss do
% MATLAB.

Ktheta = 6.9256;
Kq = Ktheta * 0.28;

A = [    -0.00643,   0.0263,      0, -32.2, 0;
          -0.0941,   -0.624,    820,     0, 0;
        -0.000222, -0.00153, -0.668,     0, 0;
                0,        0,      1,     0, 0;
                0,       -1,      0,   830, 0];
A = A + [   0, 0,           0,                0,  0;
            0, 0,  (-32.7)*Kq,   (-32.7)*Ktheta,  0;
            0, 0,  (-2.08)*Kq,   (-2.08)*Ktheta,  0;
            0, 0,           0,                0,  0;
            0, 0,           0,                0,  0];

B = [0; -32.7*(-Ktheta); -2.08*(-Ktheta); 0; 0];

C = [0, 0, 0, 0, 1];
D = 0;

planta = ss(A, B, C, D);

end