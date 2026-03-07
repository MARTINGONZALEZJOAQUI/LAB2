function [imagen, filas, columnas, canales] = cargar_imagen(nombre_archivo)
% CARGAR_IMAGEN Carga una imagen y verifica/redimensiona al mínimo 740x492
% Entrada:  nombre_archivo -> nombre del archivo 
% Salidas:  imagen, filas, columnas, canales

    % 1. Cargar la imagen
    imagen = imread(nombre_archivo);

    % 2. Verificar y redimensionar si es necesario
    [filas, columnas, canales] = size(imagen);
    fprintf('Imagen original\n');
    fprintf('Tamaño: %d x %d x %d canales\n', filas, columnas, canales);

    if columnas < 740 || filas < 492
        fprintf('Redimensionando imagen a 740x492...\n');
        imagen = imresize(imagen, [492, 740]);
        [filas, columnas, canales] = size(imagen);
        fprintf('Nuevo tamaño: %d x %d \n', filas, columnas);
    else
        fprintf('Tamaño cumple el mínimo requerido: %d x %d \n', columnas, filas);
    end

end
