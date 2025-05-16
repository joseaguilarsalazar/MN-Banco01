f = inline(input('Ingrese la función f(x): ', 's'));

% Cuántas funciones g(x) usarás
n = input('¿Cuántas funciones g(x) deseas probar?: ');
g = cell(1, n);

% Ingreso de cada g(x)
for i = 1:n
    g{i} = inline(input('g(x): ', 's'));
end

% Intervalo de análisis
a = input('Inicio del intervalo: ');
b = input('Fin del intervalo: ');

% Parámetros
paso = 0.1;
tol = 1e-6;
max_iter = 100;
raices = [];

% Aplicar punto fijo con cada g(x)
for i = 1:n
    gx = g{i};
    x = a;

    while x < b
        x0 = x;

        % Iteración de punto fijo
        for k = 1:max_iter
            x1 = gx(x0);
            if abs(x1 - x0) < tol
                break;
            end
            x0 = x1;
        end

        % Verificar que x1 sea real, válido y raíz de f(x)
        if isreal(x1) && ~isinf(x1) && abs(f(x1)) < 1e-4
            if isempty(raices) || min(abs(raices - x1)) > 1e-3
                raices(end+1) = x1;
            end
        end

        x = x + paso;
    end
end

% Mostrar las raíces reales encontradas
disp('Raíces encontradas:');
disp(raices);