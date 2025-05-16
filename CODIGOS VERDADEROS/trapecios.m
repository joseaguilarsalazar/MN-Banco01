% Ingreso de función integrando f(x)
f = inline(input('Ingrese la función f(x): ', 's'));

% Límites de integración
a = input('Ingrese el límite inferior: ');
b = input('Ingrese el límite superior: ');

% Número fijo de subintervalos
n = 100;                      % se asume un n fijo para cumplir con el ejercicio
h = (b - a) / n;

% Aplicación del método del trapecio
suma = f(a) + f(b);

for i = 1:n-1
    x = a + i * h;
    suma = suma + 2 * f(x);
end

integral = (h / 2) * suma;

% Mostrar resultado
fprintf('El valor aproximado de la integral definida es: %.6f\n', integral);