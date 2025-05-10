clc; clear;
Q = true;

while Q
    fprintf('\n*** MÉTODO DE BISECCIÓN PARA TODAS LAS RAÍCES ***\n');

    % Entrada extremos del intervalo
    a_inicial = input('Ingrese el extremo izquierdo del intervalo: ');
    b_inicial = input('Ingrese el extremo derecho del intervalo: ');

    % Entrada obligatoria: función y extremos del intervalo
    f = input('Ingrese la función f(x): ', 's');
    f = str2func(['@(x) ', f]);
    
    % Parámetros fijos
    paso = 0.1;
    tol = 1e-6;

    raices = [];

    % Recorrem el intervalo en pasos de 0.1
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
            if isempty(raices) || min(abs(raices - raiz)) > 1e-8
                raices = [raices, raiz];
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

    while true
        a = input('\n¿Desea realizar otro cálculo? (SI/NO): ', 's');
        a = upper(strtrim(a)); % Convierte a mayúsculas y elimina espacios
    
        if strcmp(a, "SI")
            Q = true;
            break; % Sale del bucle con respuesta válida
        elseif strcmp(a, "NO")
            Q = false;
            break;
        else
            fprintf("Valor no válido. Por favor, responda con SI o NO.\n");
        end
    end
end
