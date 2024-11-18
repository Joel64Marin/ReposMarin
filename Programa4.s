// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Multiplicación de dos números
// Concepto/Temática: Aritmética básica (MUL)
// Dificultad: Fácil
// Tiempo Estimado: 15-20 minutos
// Aplicación Práctica: Cálculo de precios en compras
// =====================================================================================

/*
Solución en Python:
# Multiplicar dos números
a = 7
b = 5
producto = a * b
print(f"El producto de {a} y {b} es {producto}")
*/

.section .data
num1:   .word 7            // Primer número
num2:   .word 5            // Segundo número
msg:    .asciz "El producto de %d y %d es %d\n"

.section .text
.global _start
_start:
    // Cargar los números desde la memoria
    ldr w0, =num1
    ldr w1, [w0]
    ldr w0, =num2
    ldr w2, [w0]

    // Multiplicar los números
    mul w3, w1, w2

    // Preparar e imprimir el resultado
    adr x0, msg
    mov w1, w1
    mov w2, w2
    mov w3, w3
    bl printf

    // Salida
    mov x8, #93
    svc 0
