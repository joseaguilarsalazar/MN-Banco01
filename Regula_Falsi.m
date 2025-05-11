clc; clear;
Q = 4;

while Q == 4
    fprintf('\n*** MÉTODO DE REGULA FALSI PARA TODAS LAS RAÍCES ***\n');

    % Entrada de intervalo
    a_inicial = input('Ingrese el extremo izquierdo del intervalo: ');
    b_inicial = input('Ingrese el extremo derecho del intervalo: ');

    % Entrada de función
    f_input = input('Ingrese la función f(x): ', 's');
    f = inline(f_input);

    % Parámetros fijos
    paso = 0.1;
    tol = 1e-6;
    max_iter = 1000;
    raices = [];

    % Barrido del intervalo
    x = a_inicial;
    while x < b_inicial
        a = x;
        b = x + paso;

        if f(a)*f(b) < 0
            iter = 0;
            while iter < max_iter
                fa = f(a);
                fb = f(b);
                xr = b - fb * (a - b) / (fa - fb);
                fxr = f(xr);

                if abs(fxr) < tol
                    break;
                end

                if fa * fxr < 0
                    b = xr;
                else
                    a = xr;
                end
                iter = iter + 1;
            end

            raiz = xr;

            % Verificar si la raíz ya fue registrada (evita repetidas)
            if isempty(raices) || min(abs(raices - raiz)) > 1e-3
                raices(end+1) = raiz;
                fprintf(' Raíz encontrada: %.6f\n', raiz);
            end
        end

        x = x + paso;
    end

    % Mostrar todas las raíces
    if isempty(raices)
        fprintf('No se encontraron raíces en el intervalo.\n');
    else
        fprintf('\n--- Todas las raíces encontradas ---\n');
        disp(raices');
    end

    Q = input('\n¿Desea realizar otro cálculo? (Presione 4 para repetir, otro número para salir): ');
    clc;
end