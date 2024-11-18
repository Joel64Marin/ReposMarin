// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Factorial de un número
// Concepto/Temática: Recursión/bucles
// Dificultad: Intermedia
// Tiempo Estimado: 25-35 minutos
// Aplicación Práctica: Cálculo de combinaciones
// =====================================================================================

/*
Solución en Python:
# Factorial de un número
n = 5
factorial = 1
for i in range(1, n+1):
    factorial *= i
print(f"El factorial de {n} es {factorial}")
*/

.section .data
n:      .word 5            // Número para el factorial
msg:    .asciz "El factorial de %d es %d\n"

.section .text
.global _start
_start:
    ldr w0, =n
    ldr w1, [w0]           // Número n
    mov w2, #1             // Contador
    mov w3, #1             // Acumulador

factorial_loop:
    mul w3, w3, w2         // Multiplicar acumulador por contador
    add w2, w2, #1         // Incrementar contador
    cmp w2, w1             // Comparar contador con n
    ble factorial_loop     // Repetir si contador <= n

    // Imprimir resultado
    adr x0, msg
    mov w1, w1
    mov w2, w3
    bl printf

    // Salida
    mov x8, #93
    svc 0
