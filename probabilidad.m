% Script mejorado para calcular P(x1 < x < x2) en una normal estándar usando series

% Pedir datos al usuario
x1 = input('Ingresa el valor de x1: ');
x2 = input('Ingresa el valor de x2: ');

% Validar que x1 < x2
if x1 >= x2
    error('Error: x1 debe ser menor que x2.');
end

% Advertir sobre valores grandes
if abs(x1) > 5 || abs(x2) > 5
    warning('Valores grandes detectados: la aproximación con series puede ser muy inexacta.');
end

% Parámetros de la normal estándar
mu = 0;
sigma = 1;
N = 30; % Aumentamos términos para más precisión

% Definir la constante de la normal
C = 1 / sqrt(2*pi);

% Cálculo de la integral término a término
integral = 0;
for n = 0:N
    coef = ((-1)^n) / (2^n * factorial(n));
    integral = integral + coef * ((x2^(2*n+1) - x1^(2*n+1)) / (2*n+1));
end

% Resultado final
P = C * integral;

% Mostrar el resultado
fprintf('La probabilidad P(%f < x < %f) es: %f\n', x1, x2, P);
