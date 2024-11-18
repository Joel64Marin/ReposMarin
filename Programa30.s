// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Máximo Común Divisor (MCD)
// Concepto/Temática: Aritmética, algoritmo de Euclides
// Dificultad: Intermedia
// Tiempo Estimado: 25-35 minutos
// Aplicación Práctica: Simplificación de fracciones
// =====================================================================================

/*
Solución en Python:
# Algoritmo de Euclides para encontrar el MCD
def gcd(a, b):
    while b:
        a, b = b, a % b
    return a
*/

.section .data
a: .word 56  // Primer número
b: .word 98  // Segundo número

.section .text
.global _start
_start:
    ldr w0, [a]        // Cargar el primer número
    ldr w1, [b]        // Cargar el segundo número

gcd_loop:
    cmp w1, #0         // Si b == 0, terminar
    beq end_gcd
    udiv w2, w0, w1    // Dividir a / b
    mul w3, w2, w1     // w3 = (a / b) * b
    sub w4, w0, w3     // w4 = a - (a / b) * b
    mov w0, w1         // a = b
    mov w1, w4         // b = a % b
    b gcd_loop

end_gcd:
    // El MCD está en w0
    mov x8, #93
    mov x0, #0
    svc 0
