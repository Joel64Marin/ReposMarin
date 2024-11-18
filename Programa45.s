// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Verificar si un Número es Armstrong
// Concepto/Temática: Aritmética y flujo de control
// Dificultad: Intermedia
// Tiempo Estimado: 30-40 minutos
// Aplicación Práctica: Análisis de números
// =====================================================================================

/*
Solución en Python:
# Verificar si un número es Armstrong
num = 153
sum_of_cubes = sum([int(digit)**3 for digit in str(num)])
if sum_of_cubes == num:
    print("Es un número Armstrong")
else:
    print("No es un número Armstrong")
*/

.section .data
num: .word 153

.section .text
.global _start
_start:
    ldr w0, =num
    ldr w0, [w0]      // Cargar el número

    mov w1, w0        // Copiar el número
    mov w2, #0        // Sumar los cubos de las cifras

check_armstrong:
    cmp w1, #0
    beq end_check
    udiv w3, w1, #10  // Obtener el dígito (división entera)
    mul w4, w3, w3    // Elevar al cubo
    mul w4, w4, w3
    add w2, w2, w4    // Acumular el cubo
    mov w1, w3        // Reducir el número

    b check_armstrong

end_check:
    cmp w2, w0        // Comparar la suma de los cubos con el número original
    bne not_armstrong

    // Es un número Armstrong
    mov x8, #93
    mov x0, #0
    svc 0

not_armstrong:
    // No es un número Armstrong
    mov x8, #93
    mov x0, #0
    svc 0
