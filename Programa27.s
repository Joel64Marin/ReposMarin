// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Desplazamientos a la Izquierda y Derecha
// Concepto/Temática: Operaciones de desplazamiento
// Dificultad: Intermedia
// Tiempo Estimado: 20-25 minutos
// Aplicación Práctica: Procesamiento de señales
// =====================================================================================

/*
Solución en Python:
# Desplazamientos a la Izquierda y Derecha
a = 0b1100
left_shift = a << 2
right_shift = a >> 2
*/

.section .data
a: .word 0b1100  // 12 en binario

.section .text
.global _start
_start:
    ldr w0, [a]        // Cargar el valor de 'a'
    
    lsl w1, w0, #2     // Desplazamiento a la izquierda: w1 = a << 2
    lsr w2, w0, #2     // Desplazamiento a la derecha: w2 = a >> 2

    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
