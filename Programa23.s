// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Conversión de Entero a ASCII
// Concepto/Temática: Conversión de tipos de datos
// Dificultad: Fácil
// Tiempo Estimado: 15-20 minutos
// Aplicación Práctica: Interfaces de usuario
// =====================================================================================

/*
Solución en Python:
# Conversión de Entero a ASCII
def int_to_ascii(integer):
    return chr(integer + ord('0'))
*/

.section .data
integer:    .word 5  // Entero a convertir a ASCII

.section .text
.global _start
_start:
    ldr w0, [integer]       // Cargar el número entero
    add w0, w0, #'0'        // Convertir entero a ASCII

    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
