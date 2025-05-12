clc; clear;

% Entrada del número
n = input('Ingrese el número del cual desea calcular la raíz cuadrada: ');

% Caso especial: raíz de cero
if n == 0
    fprintf('La raiz aproximada es: 0\n');
    return;
end

% Si es negativo se trabaja con su valor absoluto
negativo = false;
if n < 0
    negativo = true;
    n = abs(n);
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

% Función f(x) = x^2 - n
f = @(x) x.^2 - n;

% Método de bisección
while true
    c = (a + b) / 2;

    if abs(f(c)) < margen
        if negativo
            fprintf('La raiz imaginaria aproximada es: %.8f*i\n', c);
        else
            fprintf('La raiz aproximada es: %.8f\n', c);
        end
        break
    end

    if f(a) * f(c) > 0
        a = c;
    else
        b = c;
    end
end