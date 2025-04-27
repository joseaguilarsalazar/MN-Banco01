Q=1;
while Q==1
    fprintf('Este programa resuelve ecuacion de 2do grado \n');
    fprintf('Ordenar la ecuacion del siguiente modo\n ax^2+bx+c=0 \n');
    a=input('Ingrese el valor del coeficiente cuadratico: \n');
    if a==0
        fprintf('ERROR. EL COEFICIENTE CUADRATICO DEBE SER DIFERENTE DE CERO \n');
    else
        b=input('Ingrese el valor del coeficiente lineal: \n');
        c=input('Ingrese el valor del coeficiente independiente: \n');
        d=b^2-4*a*c;
        if d==0
            t=1;
        else
            if d>0
                t=2;
            else 
                t=3;
            end
        end
        switch t
            case 1
                fprintf('Una solucion con multiplicidad dos \n');
                x=-b/(2*a)
            case 2
                fprintf('Dos raices reales \n');
                x1=-b/(2*a)-(sqrt(-d)/(2*a))
                x2=-b/(2*a)+(sqrt(-d)/(2*a))
            otherwise
                fprintf('Raices Complejas \n');
                x1=-b/(2*a)-(sqrt(d)/(2*a))
                x2=-b/(2*a)+(sqrt(d)/(2*a))
        end      
    end
    
    Q=input('Para continuar pulse 1 \n Para cerrar el programa pulse diferente de 1 \n');
    clc;
end
