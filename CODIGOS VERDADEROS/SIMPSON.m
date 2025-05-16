% Ingreso de la función
f = inline(input('Ingrese la función f(x): ', 's'));

% Límites de integración
a = input('Ingrese el límite inferior: ');
b = input('Ingrese el límite superior: ');

% Número de subintervalos (par fijo)
n = 10;              % Simpson requiere que n sea par
h = (b - a) / n;

% Aplicar fórmula de Simpson
suma = f(a) + f(b);

for i = 1:n-1
    x = a + i * h;
    if mod(i, 2) == 0
        suma = suma + 2 * f(x);  % coeficiente 2 para pares
    else
        suma = suma + 4 * f(x);  % coeficiente 4 para impares
    end
end

integral = (h / 3) * suma;

% Mostrar resultado
fprintf('El valor aproximado de la integral definida es: %.6f\n', integral);
