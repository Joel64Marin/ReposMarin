// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Potencia (x^n)
// Concepto/Temática: Recursión/bucles
// Dificultad: Intermedia
// Tiempo Estimado: 30-40 minutos
// Aplicación Práctica: Cálculos matemáticos
// =====================================================================================

/*
Solución en Python:
# Potencia (x^n)
def power(x, n):
    if n == 0:
        return 1
    return x * power(x, n-1)
*/

.section .data
x: .word 2  // Base
n: .word 5  // Exponente

.section .text
.global _start
_start:
    ldr w0, [x]  // Cargar la base (x)
    ldr w1, [n]  // Cargar el exponente (n)
    mov w2, #1   // Inicializar el resultado en 1

power_loop:
    cmp w1, #0
    beq end_power
    mul w2, w2, w0  // Multiplicar por la base
    subs w1, w1, #1  // Decrementar el exponente
    b power_loop

end_power:
    // El resultado está en w2
    mov x8, #93
    mov x0, #0
    svc 0
