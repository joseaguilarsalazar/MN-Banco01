
% Pedir la cantidad de números
n = input('Ingrese la cantidad de números: ');

% Inicializar el vector
numeros = zeros(1, n);

% Pedir los números uno por uno
for i = 1:n
    numeros(i) = input(sprintf('Ingrese el número %d: ', i));
end

% Algoritmo de ordenamiento burbuja (de mayor a menor)
for i = 1:n-1
    for j = 1:n-i
        if numeros(j) < numeros(j+1)
            % Intercambiar valores
            temp = numeros(j);
            numeros(j) = numeros(j+1);
            numeros(j+1) = temp;
        end
    end
end

% Mostrar el resultado
disp('Números ordenados de mayor a menor:')
disp(numeros)
