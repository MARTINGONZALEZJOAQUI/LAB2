% =========================================================
% Sprint 2 - Carga de imagen y obtención de matriz de píxeles
% Laboratorio II de Telecomunicaciones - Universidad del Cauca
% =========================================================

%% 1. Cargar la imagen JPG
imagen = imread('italy.jpg');

%% 2. Verificar y redimensionar si es necesario
[filas, columnas, canales] = size(imagen);
fprintf('=== Imagen original ===\n');
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

%% 3. Separar canales RGB y obtener matrices de píxeles
matriz_R = double(imagen(:,:,1));
matriz_G = double(imagen(:,:,2));
matriz_B = double(imagen(:,:,3));

fprintf('\n=== Matrices de píxeles ===\n');
fprintf('Canal R - Min: %.0f  Max: %.0f\n', min(matriz_R(:)), max(matriz_R(:)));
fprintf('Canal G - Min: %.0f  Max: %.0f\n', min(matriz_G(:)), max(matriz_G(:)));
fprintf('Canal B - Min: %.0f  Max: %.0f\n', min(matriz_B(:)), max(matriz_B(:)));

%% 4. Mostrar imagen cargada
figure('Name','Imagen Original - italy.jpg');
imshow(imagen);
title(sprintf('Imagen cargada: %d x %d píxeles', columnas, filas));

%% 5. Mostrar los 3 canales por separado
figure('Name','Canales RGB');
subplot(1,3,1); imshow(uint8(matriz_R)); title('Canal R (Rojo)');
subplot(1,3,2); imshow(uint8(matriz_G)); title('Canal G (Verde)');
subplot(1,3,3); imshow(uint8(matriz_B)); title('Canal B (Azul)');

%% 6. Exportar variables al workspace para usar en Simulink
assignin('base', 'imagen',   imagen);
assignin('base', 'matriz_R', matriz_R);
assignin('base', 'matriz_G', matriz_G);
assignin('base', 'matriz_B', matriz_B);
assignin('base', 'filas',    filas);
assignin('base', 'columnas', columnas);

fprintf('\n=== Variables en Workspace ===\n');
fprintf('imagen    -> [%d x %d x 3] uint8\n', filas, columnas);
fprintf('matriz_R  -> [%d x %d] double\n', filas, columnas);
fprintf('matriz_G  -> [%d x %d] double\n', filas, columnas);
fprintf('matriz_B  -> [%d x %d] double\n', filas, columnas);