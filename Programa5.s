// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: División de dos números
// Concepto/Temática: Aritmética (UDIV, SDIV)
// Dificultad: Fácil
// Tiempo Estimado: 20-25 minutos
// Aplicación Práctica: Distribución de recursos
// =====================================================================================

/*
Solución en Python:
# Dividir dos números
a = 20
b = 4
cociente = a // b
print(f"El cociente de {a} entre {b} es {cociente}")
*/

.section .data
num1:   .word 20           // Dividendo
num2:   .word 4            // Divisor
msg:    .asciz "El cociente de %d entre %d es %d\n"

.section .text
.global _start
_start:
    // Cargar los números desde la memoria
    ldr w0, =num1
    ldr w1, [w0]
    ldr w0, =num2
    ldr w2, [w0]

    // Dividir los números
    udiv w3, w1, w2        // División sin signo

    // Preparar e imprimir el resultado
    adr x0, msg
    mov w1, w1
    mov w2, w2
    mov w3, w3
    bl printf

    // Salida
    mov x8, #93
    svc 0
