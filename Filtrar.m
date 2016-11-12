function EspectroFiltrado = Filtrar( EscalonUnitario )
%Filtrar espectro por encima de 75 Hz

EspectroFiltrado = [];
cont = 0;

for i=1:length(EscalonUnitario)
    cont= cont+1;
    if EscalonUnitario(2,i) < 75
        
        if EscalonUnitario(1,i) ~= 0
            EspectroFiltrado(1,cont) = EscalonUnitario(1,i);                         
        else
            EspectroFiltrado(1,cont) = 0;
        end
        
    else
       EspectroFiltrado(1,cont) = 0;
    end
    EspectroFiltrado(2,cont) = EscalonUnitario(2,i);   
end

