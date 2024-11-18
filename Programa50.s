// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Escribir en un Archivo
// Concepto/Temática: Manejo de archivos y llamadas al sistema
// Dificultad: Intermedia
// Tiempo Estimado: 25-35 minutos
// Aplicación Práctica: Registro de datos
// =====================================================================================

/*
Solución en Python:
# Escribir en un archivo
with open("output.txt", "w") as f:
    f.write("Hello, World!")
*/

.section .data
filename: .asciz "output.txt"
content:  .asciz "Hello, World!\n"

.section .text
.global _start
_start:
    // Abrir el archivo para escribir
    adr x0, filename
    mov x1, #0x241   // O_CREAT | O_WRONLY | O_TRUNC
    mov x2, #0644    // Permisos 644
    mov x8, #56      // Syscall para open
    svc 0

    // Escribir en el archivo
    mov x0, x1        // Usar el descriptor de archivo devuelto por open
    adr x1, content   // Dirección del contenido
    mov x2, #14       // Longitud del contenido
    mov x8, #64       // Syscall para write
    svc 0

    // Cerrar el archivo
    mov x8, #57       // Syscall para close
    svc 0
