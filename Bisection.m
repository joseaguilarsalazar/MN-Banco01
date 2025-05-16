f = input('Ingrese la función f(x): ', 's');
f = inline(f);

ai = input('Ingrese el extremo izquierdo del intervalo: ');
bi = input('Ingrese el extremo derecho del intervalo: ');

% Parámetros
paso = 0.1;       % Tamaño del subintervalo
tol = 1e-6;       % Tolerancia
max_iter = 200;   % Límite de iteraciones
raices = [];

x = ai;
while x < bi
    a = x;
    b = x + paso;
    
    if f(a) * f(b) < 0
        iter = 0;
        while abs(b - a) > tol && iter < max_iter
            c = (a + b)/2;
            if f(a) * f(c) < 0
                b = c;
            else
                a = c;
            end
            iter = iter + 1;
        end
        
        raiz = (a + b)/2;
        

        
        % Verificar si ya fue registrada
        if isempty(raices) || min(abs(raices - raiz)) > 1e-3
            raices(end+1) = raiz;
        end
    end
    
    x = x + paso;
end

% Salida
fprintf('Raíces encontradas:\n');
disp(raices);