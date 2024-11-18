// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Establecer, Borrar y Alternar Bits
// Concepto/Temática: Manipulación de bits
// Dificultad: Intermedia
// Tiempo Estimado: 20-25 minutos
// Aplicación Práctica: Control de dispositivos
// =====================================================================================

/*
Solución en Python:
# Establecer, Borrar y Alternar Bits
a = 0b1100
set_bit = a | (1 << 2)
clear_bit = a & ~(1 << 3)
toggle_bit = a ^ (1 << 1)
*/

.section .data
a: .word 0b1100  // 12 en binario

.section .text
.global _start
_start:
    ldr w0, [a]        // Cargar el valor de 'a'
    
    orr w1, w0, (1 << 2)   // Establecer el bit 2: w1 = a | (1 << 2)
    bic w2, w0, (1 << 3)   // Borrar el bit 3: w2 = a & ~(1 << 3)
    eor w3, w0, (1 << 1)   // Alternar el bit 1: w3 = a ^ (1 << 1)

    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
