% Pedir al usuario el número de términos de la serie
n = input('Ingrese el número de términos de la serie de potencias: ');

% Crear vector de valores de x
x = linspace(-2*pi, 2*pi, 1000); % De -2pi a 2pi, bien suave

% Calcular el valor exacto de sen(x)
y_real = sin(x);

% Calcular sen(x) usando la serie de potencias
y_series = zeros(size(x));
for k = 0:n-1
    y_series = y_series + ((-1)^k .* x.^(2*k+1)) ./ factorial(2*k+1);
end

% Graficar ambas funciones
figure;
plot(x, y_real, 'b-', 'LineWidth', 2); hold on; % Línea azul para el sen real
plot(x, y_series, 'r--', 'LineWidth', 2);       % Línea roja punteada para la serie
hold off;

% Añadir detalles al gráfico
xlabel('x');
ylabel('y');
title('Comparación de sen(x) real vs serie de potencias');
legend('sen(x) real', 'sen(x) por serie de potencias');
grid on;
