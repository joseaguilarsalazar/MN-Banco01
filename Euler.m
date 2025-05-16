% Entrada de datos
x1 = input('Ingrese el valor de x1: ');
x2 = input('Ingrese el valor de x2: ');

% Número de términos de la serie (fijo)
N = 20;

% Constante de normalización
c = 1 / sqrt(2 * pi);

% Inicializar la suma
P = 0;

% Serie de Taylor para e^(-x^2/2)
for n = 0:N
    k = ((-1)^n) / (factorial(n) * (2^n) * (2*n + 1));
    incog = k * (x2^(2*n + 1) - x1^(2*n + 1));
    P = P + incog;
end

% Multiplicar por la constante final
P = c * P;

% Mostrar resultado
fprintf('La probabilidad aproximada es: %.10f\n', P);
