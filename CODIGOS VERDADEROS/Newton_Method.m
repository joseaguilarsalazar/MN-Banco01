% Ingresar función f(x)
f = inline(input('Ingrese la función f(x): ', 's'));

% Intervalo
a = input('Inicio del intervalo: ');
b = input('Fin del intervalo: ');

% Parámetros
paso = 0.1;
tol = 1e-6;
max_iter = 100;
h = 1e-6;  % valor pequeño para derivada numérica
raices = [];

% Derivada numérica aproximada
df = @(x) (f(x + h) - f(x)) / h;

% Recorrer intervalo
x = a;
while x < b
    x0 = x;
    iter = 0;

    % Newton-Raphson
    while iter < max_iter
        if df(x0) == 0
            break;
        end

        x1 = x0 - f(x0)/df(x0);

        if ~isreal(x1) || ~isfinite(x1)
            break;
        end

        if abs(x1 - x0) < tol
            break;
        end

        x0 = x1;
        iter = iter + 1;
    end

    raiz = x1;

    % Guardar solo raíces reales, válidas y no repetidas
    if isreal(raiz) && isfinite(raiz) && abs(f(raiz)) < tol
        if isempty(raices) || min(abs(raices - raiz)) > 1e-3
            raices(end+1) = raiz;
        end
    end

    x = x + paso;
end

% Mostrar resultados
disp('Raíces encontradas:');
disp(raices);

