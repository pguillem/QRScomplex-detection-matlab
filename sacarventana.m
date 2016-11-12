function fftventana = sacarventana(ecg,ini,fin)
    
    ventana = ecg(1,ini:fin);
    fftventana = fft(ventana,1000);
    fftventana = abs(fftventana);
    
end

