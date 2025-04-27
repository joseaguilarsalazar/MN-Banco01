% Solicitar al usuario la función a integrar
f_str = input('Ingrese la función a integrar (en términos de x, por ejemplo, x.^2 + 3*x): ', 's');
f = str2func(['@(x) ', f_str]);

% Solicitar los límites de integración
a = input('Ingrese el límite inferior de integración (a): ');
b = input('Ingrese el límite superior de integración (b): ');

% Solicitar el número de subintervalos
n = input('Ingrese el número de subintervalos (n): ');

% Verificar que n sea un entero positivo
if n <= 0 || mod(n,1) ~= 0
    error('El número de subintervalos debe ser un entero positivo.');
end

% Calcular el tamaño del paso
h = (b - a) / n;

% Generar los puntos de evaluación
x = a:h:b;

% Evaluar la función en los puntos x
y = f(x);

% Aplicar la fórmula del trapecio compuesto
integral = (h/2) * (y(1) + 2*sum(y(2:end-1)) + y(end));

% Mostrar el resultado
fprintf('\nEl valor aproximado de la integral definida es: %.6f\n', integral);
