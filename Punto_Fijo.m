f= input('Ingrese la función f(x): ', 's');
f = inline(f);

a = input('Ingrese el extremo izquierdo del intervalo: ');
b = input('Ingrese el extremo derecho del intervalo: ');

% Paso 2: Parámetros
lambda = 0.1;              % Escala de corrección
g = @(x) x - lambda*f(x);  % Definición de g(x)
paso = 0.1;                % Paso para barrido
tol = 1e-6;                % Tolerancia
max_iter = 1000;           % Límite de iteraciones

raices = [];               % Vector para almacenar raíces encontradas

% Paso 3: Barrido del intervalo
x = a;
while x <= b
    x0 = x;
    iter = 0;
    
    x1 = g(x0);
    while abs(x1 - x0) > tol && iter < max_iter
        x0 = x1;
        x1 = g(x0);
        iter = iter + 1;
    end
    
    % Verificar si la raíz hallada es válida y no repetida
    if abs(f(x1)) < tol
        if isempty(raices) || min(abs(raices - x1)) > 1e-3
            raices(end+1) = x1;
        end
    end
    
    x = x + paso;
end

% Mostrar todas las raíces encontradas
fprintf('\n--- Todas las raíces encontradas ---\n');
disp(unique(round(raices, 6)));