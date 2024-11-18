// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Calculadora Simple (Suma, Resta, Multiplicación, División)
// Concepto/Temática: Aritmética y flujo de control
// Dificultad: Intermedia
// Tiempo Estimado: 30-40 minutos
// Aplicación Práctica: Herramientas matemáticas
// =====================================================================================

/*
Solución en Python:
# Calculadora simple
a = 10
b = 5
sum_result = a + b
diff_result = a - b
mul_result = a * b
div_result = a / b
*/

.section .data
a: .word 10
b: .word 5

.section .text
.global _start
_start:
    ldr w0, =a
    ldr w1, [w0]      // Cargar el primer número
    ldr w0, =b
    ldr w2, [w0]      // Cargar el segundo número

    // Suma
    add w3, w1, w2    // Realizar la suma

    // Resta
    sub w4, w1, w2    // Realizar la resta

    // Multiplicación
    mul w5, w1, w2    // Realizar la multiplicación

    // División
    sdiv w6, w1, w2   // Realizar la división

    // Los resultados están en w3, w4, w5, w6
    mov x8, #93
    mov x0, #0
    svc 0
