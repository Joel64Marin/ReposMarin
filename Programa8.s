// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Serie de Fibonacci
// Concepto/Temática: Bucles y manejo de memoria
// Dificultad: Intermedia
// Tiempo Estimado: 30-40 minutos
// Aplicación Práctica: Modelado de fenómenos naturales
// =====================================================================================

/*
Solución en Python:
# Serie de Fibonacci
n = 10
a, b = 0, 1
for _ in range(n):
    print(a, end=" ")
    a, b = b, a + b
*/

.section .data
n:      .word 10           // Número de términos
msg:    .asciz "%d "

.section .text
.global _start
_start:
    ldr w0, =n
    ldr w1, [w0]           // Número de términos
    mov w2, #0             // Primer término
    mov w3, #1             // Segundo término

fibonacci_loop:
    adr x0, msg
    mov w4, w2
    bl printf              // Imprimir el término actual

    // Calcular siguiente término
    add w4, w2, w3
    mov w2, w3
    mov w3, w4

    subs w1, w1, #1        // Decrementar el número de términos
    bne fibonacci_loop     // Repetir si quedan términos

    // Salida
    mov x8, #93
    svc 0
