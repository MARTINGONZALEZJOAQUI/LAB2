function secuencia_pixeles = serializar_pixeles(imagen_indexada, filas, columnas)
% SERIALIZAR_PIXELES Convierte la matriz indexada en secuencia unidimensional
% Entrada:  imagen_indexada  -> matriz 2D de índices de píxeles
%           filas, columnas  -> dimensiones esperadas
% Salida:   secuencia_pixeles -> vector 1D de índices

    % Serializar la matriz en un vector
    secuencia_pixeles = imagen_indexada(:);

    % Verificar longitud esperada
    if length(secuencia_pixeles) == (filas * columnas)
        fprintf('Secuencia de píxeles serializada \n');
        fprintf('Longitud esperada: %d \n', length(secuencia_pixeles));
    else
        fprintf('Advertencia: La longitud no coincide con el tamaño de la imagen.\n');
    end

end
