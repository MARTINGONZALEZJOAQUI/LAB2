function [imagen_indexada, paleta] = comprimir_paleta(imagen)
% COMPRIMIR_PALETA Aplica compresión por paleta indexada de 256 colores
% Entrada:  imagen         -> imagen RGB uint8
% Salidas:  imagen_indexada -> imagen comprimida con índices
%           paleta          -> paleta de 256 colores [256x3]

    % Aplicar compresión por paleta
    [imagen_indexada, paleta] = rgb2ind(imagen, 256);

    % Guardar paleta para uso en receptor
    save('paleta_colores.mat', 'paleta');

    fprintf('Compresión por paleta aplicada\n');
    fprintf('Colores en la paleta: %d\n', size(paleta, 1));
    fprintf('Tamaño imagen indexada: %d x %d\n', size(imagen_indexada,1), size(imagen_indexada,2));

    % ── Comparación de tamaño en bytes ──────────────────
    bytes_original   = numel(imagen) * 3;
    bytes_comprimida = numel(imagen_indexada) + numel(paleta) * 3 * 8;
    reduccion        = (1 - bytes_comprimida / bytes_original) * 100;

    fprintf('\n--- Comparación de tamaño ---\n');
    fprintf('Bytes imagen original  : %d\n', bytes_original);
    fprintf('Bytes imagen comprimida: %d\n', bytes_comprimida);
    fprintf('Reducción de datos     : %.1f%%\n', reduccion);

    % ── Comparación visual ──────────────────────────────
    figure('Name', 'Comparación: Original vs Comprimida');

    subplot(1,2,1);
    imshow(imagen);
    title(sprintf('Original RGB\n%d x %d x 3 canales', size(imagen,1), size(imagen,2)));

    subplot(1,2,2);
    imshow(imagen_indexada, paleta);
    title(sprintf('Comprimida (256 colores)\n%d x %d indexada', size(imagen_indexada,1), size(imagen_indexada,2)));

end
