clc; clear;
Q = 4;

while Q == 4
    fprintf('\n*** MÉTODO DE BISECCIÓN PARA TODAS LAS RAÍCES ***\n');

    % Entrada de función y extremos del intervalo
    f = input('Ingrese la función f(x): ', 's');
    f = inline(f);
    a_inicial = input('Ingrese el extremo izquierdo del intervalo: ');
    b_inicial = input('Ingrese el extremo derecho del intervalo: ');

    % Parámetros fijos
    paso = 0.1;
    tol = 1e-6;

    raices = [];

    % Recorrer intervalo
    x = a_inicial;
    while x < b_inicial
        a = x;
        b = x + paso;

        if f(a)*f(b) < 0
            iter = 0;
            while abs(b - a) > tol && iter < 100
                xm = (a + b)/2;
                if f(a)*f(xm) < 0
                    b = xm;
                else
                    a = xm;
                end
                iter = iter + 1;
            end
            raiz = (a + b)/2;

            % Verificar si la raíz ya fue registrada
            if isempty(raices) || min(abs(raices - raiz)) > 1e-3
                raices(end+1) = raiz;
                fprintf(' Raíz encontrada: %.6f\n', raiz);
            end
        end

        x = x + paso;
    end

    if isempty(raices)
        fprintf('No se encontraron raíces en el intervalo.\n');
    else
        fprintf('\n--- Todas las raíces encontradas ---\n');
        disp(raices');
    end

    Q = input('\n¿Desea realizar otro cálculo? (Presione 4 para repetir, otro número para salir): ');
    clc;
end
