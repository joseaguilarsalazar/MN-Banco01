clc; clear;

% Entrada del número
n = input('Ingrese el número del cual desea calcular la raíz cuadrada: ');

% Verificación de número positivo
if n <= 0
    error('Debe ingresar un número positivo mayor que cero.');
end

% Definir intervalo [a, b]
if n >= 1
    a = 0;
    b = n;
else
    a = 0;
    b = 1;
end

% Precisión
margen = 1e-8;

% Definir función f(x)
f = @(x) x.^2 - n;

% Método de bisección
while true
    c = (a + b) / 2;

    if abs(f(c)) < margen
        fprintf('Su raiz aproximada es: %.8f\n', c);  % Solo imprime la raíz
        break
    end

    if f(a) * f(c) > 0
        a = c;
    else
        b = c;
    end
end