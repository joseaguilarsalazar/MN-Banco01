while true
    fprintf('Ingrese el sistema angular que desea usar\n');
    sistema = input('Sexagesimal (1), Centesimal (2), Radian (3): ');

    if sistema == 1 || sistema == 2 || sistema == 3
        break; % Salir del bucle si el sistema es válido
    else
        fprintf('Opción inválida. Debe ser 1, 2 o 3.\n\n');
    end
end

angulo = input('Ingrese el valor del ángulo: ');

switch sistema
    case 1
        % Ya está en sexagesimal
        angulo_sexagesimal = angulo;
    case 2
        % De centesimal a sexagesimal
        angulo_sexagesimal = angulo * (9/10);
    case 3
        % De radianes a sexagesimal
        angulo_sexagesimal = angulo * (180/pi);
end

while true
    fprintf('Ingrese la función trigonométrica que desea realizar\n');
    fprintf('Opciones: seno, coseno, tangente, cosecante, secante, cotangente\n');
    funcion = lower(input('', 's')); % Convertir a minúsculas para comparación fácil

    switch funcion
        case 'seno'
            resultado = sin(deg2rad(angulo_sexagesimal));
        case 'coseno'
            resultado = cos(deg2rad(angulo_sexagesimal));
        case 'tangente'
            resultado = tan(deg2rad(angulo_sexagesimal));
        case 'cosecante'
            resultado = 1 / sin(deg2rad(angulo_sexagesimal));
        case 'secante'
            resultado = 1 / cos(deg2rad(angulo_sexagesimal));
        case 'cotangente'
            resultado = 1 / tan(deg2rad(angulo_sexagesimal));
        otherwise
            fprintf('Función no reconocida. Intente de nuevo.\n\n');
            continue; % Vuelve a pedir si no es una función válida
    end

    fprintf('El resultado de %s(%.4f°) es: %.6f\n', funcion, angulo_sexagesimal, resultado);
    break; % Salir del bucle si la función fue válida
end
