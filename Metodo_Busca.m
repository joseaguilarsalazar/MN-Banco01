margen = 0.00001;

while true
    fprintf('Metodo Busca \n');
    F = input('Ingrese la ecuación: ', 's');
    try
    f = str2func(['@(x) ', F]);
    catch
        fprintf('ERROR al interpretar la función. Asegúrate de escribirla correctamente, como por ejemplo: x.^2 - 4\n');
        continue
    end
    eI = input('Ingrese el exrtremo Izquierdo: \n');
    eD = input('Ingrese el exrtremo Derecho: \n');

    if eI > eD
        a = eI;
        ei = eD;
        ed = a;
    else
        if eI == eD
           fprintf('ERROR: los extremos deben ser diferentes\n');
           continue
        end
    end
    incremento = input('Ingrese el incremento: \n');

    if incremento == 0
        incremento = 1;
    end
    while true
        if sign(f(eI)) == sign(f(eI + incremento))
           eI = eI + incremento;
        else
            eD = eI + incremento;
            incremento = incremento/100;
        end
        
        if eI == eD
            fprintf('No hay solucion :(');
            break
        end
    
        if abs(f(eI)) < margen
            fprintf('La raiz es: %.6f \n', eI);
            fprintf('El resultado es %6f.: \n', f(eI));
            break
        end
    end
end