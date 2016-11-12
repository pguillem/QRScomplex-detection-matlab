function nuevoespectro = FiltrarEspectro( filtrado, espectro )
%Aplicamos Filtro al Espectro

nuevoespectro = [];
    for i=1:length(filtrado)
        indice = filtrado(2,i);
        
        if(filtrado(1,i) == 1)
            nuevoespectro(1,i) = espectro(indice+1); %perrada
        else
            nuevoespectro(1,i) = 0; %perrada
        end
        nuevoespectro(2,i) = indice;
    end
end

