f=input('Ingrese f(x):\n','s');
f=inline(f);
ai=input('Ingresa izquierda:\n');
bi=input('Ingresa derecha:\n');

paso=0.1;
tol=1e-8;

raices=[];

x=ai;
while x<bi
    a=x;
    b=x+paso;

    if f(a)*f(b)<0
    iter=0;
        while abs(b-a)>tol && iter<1000
        c=(a+b)/2;
            if f(a)*f(c)>0
            a=c;
            else
            b=c;
            end
        iter=iter+1;
        end
        raiz=(a+b)/2;

        if isempty(raices)||min(abs(raices-raiz))>1e-8
            raices(end+1)=raiz;
        end
    end
        x=x+paso;
end

    if isempty(raices)
        fprintf('ERROR: Raices no encontradas.')
    else
        fprintf('\nTodas las raices encontradas:\n')
        disp(raices);
    end
