// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Detección de Desbordamiento en Suma
// Concepto/Temática: Detección de desbordamiento
// Dificultad: Difícil
// Tiempo Estimado: 30-40 minutos
// Aplicación Práctica: Seguridad informática
// =====================================================================================

/*
Solución en Python:
# Detección de desbordamiento en suma
a = 2147483647
b = 1
try:
    result = a + b
    if result > 2147483647:
        raise OverflowError("Desbordamiento detectado")
except OverflowError as e:
    print(e)
*/

.section .data
a: .word 2147483647
b: .word 1
overflow_msg: .asciz "Desbordamiento detectado\n"

.section .text
.global _start
_start:
    ldr w0, =a
    ldr w0, [w0]      // Cargar el primer número
    ldr w1, =b
    ldr w1, [w1]      // Cargar el segundo número

    add w2, w0, w1    // Sumar los dos números
    cmp w2, w0        // Comparar el resultado con el primer número
    bgt overflow      // Si el resultado es mayor, hay desbordamiento

    // No hay desbordamiento
    mov x8, #93
    mov x0, #0
    svc 0

overflow:
    // Imprimir mensaje de desbordamiento
    adr x0, overflow_msg
    bl printf
    mov x8, #93
    mov x0, #0
    svc 0
