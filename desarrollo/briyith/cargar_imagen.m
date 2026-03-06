% 1. Cargar la imagen JPG
imagen = imread('italy.jpg');

% Verificar y redimensionar si es necesario
[filas, columnas, canales] = size(imagen);
fprintf('Imagen original\n');
fprintf('Tamaño: %d x %d x %d canales\n', filas, columnas, canales);

% Redimensionar a exactamente 740x492 si no cumple el mínimo
if columnas < 740 || filas < 492
    fprintf('Redimensionando imagen a 740x492...\n');
    imagen = imresize(imagen, [492, 740]);
    [filas, columnas, canales] = size(imagen);
    fprintf('Nuevo tamaño: %d x %d ✓\n', filas, columnas);
else
    fprintf('Tamaño cumple el mínimo requerido: %d x %d ✓\n', columnas, filas);
end

% 2. Compresión por paleta
[imagen_indexada, paleta] = rgb2ind(imagen,256);

save('paleta_colores.mat','paleta')

% Convertir imagen indexada en secuencia de píxeles
secuencia_pixeles = imagen_indexada(:);

if length(secuencia_pixeles) == (filas*columnas)
    fprintf('La secuencia de píxeles tiene la longitud esperada: %d ✓\n', length(secuencia_pixeles));
else
    fprintf('Advertencia: La longitud de la secuencia de píxeles no coincide con el tamaño de la imagen.\n');
end

