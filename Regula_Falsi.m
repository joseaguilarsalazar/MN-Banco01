F = input('Ingrese la ecuación: ', 's');
a = input('Primer valor del intervalo: ');
b = input('Segundo valor del intervalo: ');
margen = 0.00000001;

% Convertir string a función anónima
f = str2func(['@(x) ', F]);
while true
    fprintf('[%.6f, %.6f]\n', a, b);
    c = ((f(b)*a)-(f(a)*b))/(f(b)-f(a));
    if f(c) == 0 || abs(f(c)) < margen
        fprintf('La raíz es: %.6f\n', c);
        fprintf('El valor de f(c) es: %.6f\n', f(c));
        break
    end
    if sign(f(c)) == sign(f(a))
        a = c;
    else
        b = c;
    end
    if f(a) * f(b) > 0
    error('La función no cambia de signo en el intervalo. No se puede aplicar bisección.');
    end
end