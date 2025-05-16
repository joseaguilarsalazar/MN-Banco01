% Entrada de función y extremos
f = input('Ingrese la función f(x): ', 's');
f = inline(f);

a_global = input('Ingrese el extremo izquierdo del intervalo global: ');
b_global = input('Ingrese el extremo derecho del intervalo global: ');

% Parámetros
paso = 0.1;
tol = 1e-6;
max_iter = 100;
raices = [];

% Bucle para barrer todo el intervalo
x = a_global;
while x < b_global
    a = x;
    b = x + paso;
    
    if f(a) * f(b) < 0
        iter = 0;
        fa = f(a);
        fb = f(b);
        
        % Regla falsa clásica
        while abs(b - a) > tol && iter < max_iter
            c = b - fb * (a - b) / (fa - fb);
            fc = f(c);
            
            if abs(fc) < tol
                break;
            end
            
            if fa * fc < 0
                b = c;
                fb = fc;
            else
                a = c;
                fa = fc;
            end
            
            iter = iter + 1;
        end
        
        raiz = c;
        
        % Evitar raíces duplicadas
        if isempty(raices) || min(abs(raices - raiz)) > 1e-3
            raices(end+1) = raiz;
        end
    end
    
    x = x + paso;
end

% Salida
fprintf('Raíces encontradas:\n');
disp(raices);