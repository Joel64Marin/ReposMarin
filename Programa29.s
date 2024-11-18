// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Contar los Bits Activados en un Número
// Concepto/Temática: Operaciones bit a bit
// Dificultad: Intermedia
// Tiempo Estimado: 20-30 minutos
// Aplicación Práctica: Procesamiento de datos, compresión
// =====================================================================================

/*
Solución en Python:
# Contar los Bits Activados
a = 0b11010101
bits_count = bin(a).count('1')
*/

.section .data
a: .word 0b11010101  // 213 en binario

.section .text
.global _start
_start:
    ldr w0, [a]        // Cargar el valor de 'a'
    mov w1, #0         // Contador de bits activados

count_bits:
    cmp w0, #0         // Si a == 0, termina
    beq end_count

    and w2, w0, #1     // Obtener el bit menos significativo
    add w1, w1, w2     // Incrementar contador si el bit está activado
    lsr w0, w0, #1     // Desplazar a la derecha
    b count_bits

end_count:
    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
