# Modelización hardware de la jerarquía de memoria en un multiprocesador
Se modela la coherencia de cache en un sistema multiprocesador con caches privadas de escritura retardada para mantener la coherencia en la observación de la jerarquía de memoria. Para mantener la coherencia entre las caches privadas se utiliza un protocolo de directorio con política de invalidación. La especificación se efectúa a nivel de transferencia entre registros (RTL), utilizando VHDL. La especificación será verificada mediante simulación (Modelsim) y trazas de acceso a memoria.

Para eliminar todas las carpetas de compilación y simulación de Quartus:
	find . -type d \\( -name "db" -o -name "simulation" -o -name "output_files" -o -name "incremental_db" \\) -exec rm -rf {} +
	
