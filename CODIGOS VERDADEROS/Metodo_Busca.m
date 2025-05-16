% Ingresar la función
f = inline(input('Ingrese la función f(x): ', 's'));

% Ingreso del intervalo
a = input('Inicio del intervalo: ');
b = input('Fin del intervalo: ');

% Parámetros
paso = 0.1;
tol = 1e-6;
max_iter = 200;
raices = [];

% Barrido del intervalo
x = a;
while x < b
    x1 = x;
    x2 = x + paso;

    y1 = f(x1);
    y2 = f(x2);

    % Cambio de signo = posible raíz en [x1, x2]
    if isreal(y1) && isreal(y2) && y1 * y2 < 0
        % Aplicar bisección para refinar
        a1 = x1;
        b1 = x2;
        iter = 0;
        
        while abs(b1 - a1) > tol && iter < max_iter
            c = (a1 + b1) / 2;
            if f(a1) * f(c) < 0
                b1 = c;
            else
                a1 = c;
            end
            iter = iter + 1;
        end
        
        raiz = (a1 + b1) / 2;
        
        % Verificar duplicados
        if isempty(raices) || min(abs(raices - raiz)) > 1e-3
            raices(end+1) = raiz;
        end
    end

    x = x + paso;
end

% Mostrar resultados
disp('Raíces encontradas:');
disp(raices);
