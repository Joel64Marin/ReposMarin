// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Operaciones AND, OR, XOR a Nivel de Bits
// Concepto/Temática: Operaciones a nivel de bits
// Dificultad: Intermedia
// Tiempo Estimado: 20-30 minutos
// Aplicación Práctica: Criptografía, manipulación de datos
// =====================================================================================

/*
Solución en Python:
# Operaciones AND, OR, XOR a nivel de bits
a = 0b1100
b = 0b1010
and_result = a & b
or_result = a | b
xor_result = a ^ b
*/

.section .data
a: .word 0b1100  // 12 en binario
b: .word 0b1010  // 10 en binario

.section .text
.global _start
_start:
    ldr w0, [a]        // Cargar el valor de 'a'
    ldr w1, [b]        // Cargar el valor de 'b'
    
    and w2, w0, w1     // AND: w2 = a & b
    orr w3, w0, w1     // OR: w3 = a | b
    eor w4, w0, w1     // XOR: w4 = a ^ b

    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
