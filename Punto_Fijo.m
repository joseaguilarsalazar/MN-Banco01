F = input('Ingrese la ecuación: ', 's');
x0 = input('Primer valor del intervalo: ');

margen = 0.01;
f = str2func(['@(x) ', F]);
error = 1;
g = @(x) x - f(x);

% Derivada numérica de g(x)
h = 1e-6;  % pequeño valor para la aproximación de la derivada
dg = @(x) (g(x + h) - g(x)) / h;  % diferencia finita

% Iteración del punto fijo
max_iter = 1000;  % límite para evitar bucles infinitos
iter = 0;

while error > margen
    x1 = g(x0);

    % Condición de parada si x1 es Inf o NaN
    if isinf(x1) || isnan(x1)
        error('El método diverge: el valor de x1 se vuelve infinito o indefinido.');
    end

    error = abs(x1 - x0);
    fprintf('%.6f\t %.6f\t %.6f\n', x0, x1, error);
    x0 = x1;
    iter = iter + 1;

    if iter > max_iter
        error('Se alcanzó el número máximo de iteraciones sin converger.');
    end
end

% Evaluar la derivada numérica en la raíz aproximada
valor_derivada = dg(x1);

% Verificación de convergencia con |g'(x)| < 1
if abs(valor_derivada) >= 1
    warning('La derivada |g''(x)| >= 1 en la raíz aproximada. El método podría no haber convergido correctamente.');
end

fprintf('\nResultado:\n');
fprintf('La raíz aproximada es: %.6f\n', x1);
