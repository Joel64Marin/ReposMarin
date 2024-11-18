// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Convertir Decimal a Binario
// Concepto/Temática: Conversión, bucles
// Dificultad: Intermedia
// Tiempo Estimado: 25-30 minutos
// Aplicación Práctica: Conversión de datos
// =====================================================================================

/*
Solución en Python:
# Convertir decimal a binario
decimal = 29
binary = bin(decimal)[2:]
*/

.section .data
decimal: .word 29   // Número decimal

.section .text
.global _start
_start:
    ldr w0, =decimal
    ldr w0, [w0]      // Cargar número decimal
    mov w1, #0        // Inicializar el resultado binario

convert_loop:
    cmp w0, #0
    beq end_convert
    and w2, w0, #1    // Obtener el bit menos significativo
    orr w1, w1, w2, lsl #1  // Agregar bit al resultado binario
    lsr w0, w0, #1    // Desplazar el número hacia la derecha
    b convert_loop

end_convert:
    // El número binario está en w1
    mov x8, #93
    mov x0, #0
    svc 0
