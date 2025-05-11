while true
    fprintf('Ingrese el sistema angular que desea usar\n');
    sistema = input('Sexagesimal (1), Centesimal (2), Radian (3): ');

    if sistema == 1 || sistema == 2 || sistema == 3
        break;
    else
        fprintf('Opción inválida. Debe ser 1, 2 o 3.\n\n');
    end
end

angulo = input('Ingrese el valor del ángulo: ');

switch sistema
    case 1
        angulo_radian = deg2rad(angulo);
    case 2
        angulo_radian = angulo * (pi / 200);
    case 3
        angulo_radian = angulo;
end

while true
    fprintf('Ingrese la función trigonométrica que desea realizar\n');
    fprintf('Opciones: seno, coseno, tangente, cosecante, secante, cotangente\n');
    funcion = lower(input('', 's'));

    n_terminos = 100;  % Número de términos para la serie
    epsilon = 1e-10;   % Umbral para considerar cero

    switch funcion
        case 'seno'
            resultado = taylor_sin(angulo_radian, n_terminos);

        case 'coseno'
            resultado = taylor_cos(angulo_radian, n_terminos);

        case 'tangente'
            sen = taylor_sin(angulo_radian, n_terminos);
            cos = taylor_cos(angulo_radian, n_terminos);
            if abs(cos) < epsilon
                fprintf('Error: El coseno es aproximadamente cero. Tangente indefinida.\n\n');
                continue;
            end
            resultado = sen / cos;

        case 'cosecante'
            sen = taylor_sin(angulo_radian, n_terminos);
            if abs(sen) < epsilon
                fprintf('Error: El seno es aproximadamente cero. Cosecante indefinida.\n\n');
                continue;
            end
            resultado = 1 / sen;

        case 'secante'
            cos = taylor_cos(angulo_radian, n_terminos);
            if abs(cos) < epsilon
                fprintf('Error: El coseno es aproximadamente cero. Secante indefinida.\n\n');
                continue;
            end
            resultado = 1 / cos;

        case 'cotangente'
            sen = taylor_sin(angulo_radian, n_terminos);
            if abs(sen) < epsilon
                fprintf('Error: El seno es aproximadamente cero. Cotangente indefinida.\n\n');
                continue;
            end
            cos = taylor_cos(angulo_radian, n_terminos);
            resultado = cos / sen;

        otherwise
            fprintf('Función no reconocida. Intente de nuevo.\n\n');
            continue;
    end

    fprintf('El resultado de %s del ángulo ingresado es: %.6f\n', funcion, resultado);
    break;
end

function s = taylor_sin(x, n)
    s = 0;
    for i = 0:n
        s = s + ((-1)^i * x^(2*i + 1)) / factorial(2*i + 1);
    end
end

function c = taylor_cos(x, n)
    c = 0;
    for i = 0:n
        c = c + ((-1)^i * x^(2*i)) / factorial(2*i);
    end
end
