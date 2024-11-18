// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Mínimo Común Múltiplo (MCM)
// Concepto/Temática: Operaciones aritméticas
// Dificultad: Intermedia
// Tiempo Estimado: 25-35 minutos
// Aplicación Práctica: Cálculo de múltiplos
// =====================================================================================

/*
Solución en Python:
# Mínimo Común Múltiplo (MCM)
def lcm(a, b):
    def gcd(a, b):
        while b:
            a, b = b, a % b
        return a
    return abs(a * b) // gcd(a, b)
*/

.section .data
a: .word 12  // Primer número
b: .word 15  // Segundo número

.section .text
.global _start
_start:
    ldr w0, [a]        // Cargar el primer número
    ldr w1, [b]        // Cargar el segundo número

    // Calcular el MCD
    mov w2, w0
gcd_loop:
    cmp w1, #0
    beq end_gcd
    udiv w3, w2, w1
    mul w4, w3, w1
    sub w5, w2, w4
    mov w2, w1
    mov w1, w5
    b gcd_loop

end_gcd:
    // El MCD está en w2, calcular el MCM
    mul w3, w0, w2
    udiv w4, w3, w1  // MCM = (a * b) / MCD

    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
