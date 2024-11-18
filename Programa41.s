// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Conversión de Decimal a Hexadecimal
// Concepto/Temática: Conversión de datos
// Dificultad: Intermedia
// Tiempo Estimado: 25-30 minutos
// Aplicación Práctica: Conversión de datos
// =====================================================================================

/*
Solución en Python:
# Convertir decimal a hexadecimal
decimal = 123
hexadecimal = hex(decimal)[2:]
*/

.section .data
decimal: .word 123   // Número decimal

.section .text
.global _start
_start:
    ldr w0, =decimal
    ldr w0, [w0]      // Cargar número decimal
    mov w1, #0        // Inicializar el resultado hexadecimal

convert_loop:
    cmp w0, #0
    beq end_convert
    and w2, w0, #15   // Obtener los 4 bits menos significativos
    add w2, w2, #48   // Convertir a ASCII
    cmp w2, #58
    blt add_char
    add w2, w2, #7    // Convertir números 10-15 a A-F

add_char:
    strb w2, [x1]     // Almacenar el carácter hexadecimal
    lsr w0, w0, #4    // Desplazar el número hacia la derecha
    add x1, x1, #1    // Avanzar en el buffer
    b convert_loop

end_convert:
    // El número hexadecimal está en el buffer
    mov x8, #93
    mov x0, #0
    svc 0
