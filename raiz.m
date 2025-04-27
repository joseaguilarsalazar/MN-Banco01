n = input('Ingrese el número del cual desea calcular la raíz cuadrada: ');

% Definir automáticamente el intervalo
if n >= 1
    a = 0;
    b = n;
elseif n > 0 && n < 1
    a = 0;
    b = 1;
else
    error('Debe ingresar un número positivo.');
end

margen = 1e-8;

% Definir la función
f = @(x) x.^2 - n;

% Verificar que haya cambio de signo (en teoría siempre lo habrá con este intervalo)
if f(a) * f(b) > 0
    error('La función no cambia de signo en el intervalo. No se puede aplicar bisección.');
end

while true
    fprintf('[%.8f, %.8f]\n', a, b);
    c = (a + b) / 2;
    if f(c) == 0 || abs(f(c)) < margen
        fprintf('La raíz aproximada es: %.8f\n', c);
        fprintf('El valor de f(c) es: %.8f\n', f(c));
        break
    end
    if sign(f(c)) == sign(f(a))
        a = c;
    else
        b = c;
    end
end
