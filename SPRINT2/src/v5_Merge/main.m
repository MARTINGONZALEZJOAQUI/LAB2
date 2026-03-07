% MAIN - Archivo principal del transmisor Sprint 2


fprintf('  SPRINT 2 - Procesamiento de imagen\n');


% ── Función 1 Cargar imagen ──────────────────────────────
fprintf('--- Función 1 Cargar imagen ---\n');
[imagen, filas, columnas, canales] = cargar_imagen('italy.jpg');

% ── Función 2 Compresión por paleta ─────────────────────
fprintf('\n--- Función 2 Compresión por paleta ---\n');
[imagen_indexada, paleta] = comprimir_paleta(imagen);

% ── Función 3 Serialización de píxeles ──────────────────
fprintf('\n--- Función 3 Serialización de píxeles ---\n');
secuencia_pixeles = serializar_pixeles(imagen_indexada, filas, columnas);

% ── Función 4 Conversión a binario ──────────────────────
fprintf('\n--- Función 4 Conversión a binario ---\n');
secuencia_binaria = convertir_binario(secuencia_pixeles, filas, columnas);


fprintf('  Sprint 2 completado exitosamente \n');
