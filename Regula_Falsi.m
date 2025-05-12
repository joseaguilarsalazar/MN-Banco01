f_input = input('Ingrese la función f(x): ', 's');
f = inline(f_input);
a_inicial = input('Ingrese el extremo izquierdo del intervalo: ');
b_inicial = input('Ingrese el extremo derecho del intervalo: ');

% Parámetros
paso = 0.1;
tol = 1e-6;
max_iter = 1000;
raices = [];

% Recorrido por subintervalos
x = a_inicial;
while x < b_inicial
    a = x;
    b = x + paso;

    if f(a) * f(b) < 0
        iter = 0;
        while abs(b - a) > tol && iter < max_iter
            fa = f(a);
            fb = f(b);
            c = b - fb * (a - b) / (fa - fb);

            fc = f(c);
            if fa * fc < 0
                b = c;
            else
                a = c;
            end

            iter = iter + 1;
        end

        raiz = c;

        if isempty(raices) || min(abs(raices - raiz)) > 1e-3
            raices(end+1) = raiz;
        end
    end

    x = x + paso;
end

if isempty(raices)
    fprintf('No se encontraron raíces.\n');
else
    fprintf('--- Raíces encontradas ---\n');
    disp(raices');
end
