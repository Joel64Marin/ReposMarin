// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Resta de dos números
// Concepto/Temática: Aritmética básica
// Dificultad: Fácil
// Tiempo Estimado: 10-15 minutos
// Aplicación Práctica: Calculadoras, operaciones simples
// =====================================================================================

/*
Solución en Python:
# Restar dos números
a = 30
b = 10
resta = a - b
print(f"La resta de {a} menos {b} es {resta}")
*/

// Inicio del programa en Assembly
.section .data
num1:   .word 30           // Primer número
num2:   .word 10           // Segundo número
msg:    .asciz "La resta de %d menos %d es %d\n"

.section .text
.global _start
_start:
    // Cargar los números desde la memoria
    ldr w0, =num1          // Dirección del primer número
    ldr w1, [w0]           // Cargar el valor de num1 en w1
    ldr w0, =num2          // Dirección del segundo número
    ldr w2, [w0]           // Cargar el valor de num2 en w2

    // Restar los números
    sub w3, w1, w2         // w3 = w1 - w2

    // Preparar la llamada a printf
    adr x0, msg            // Dirección del mensaje de formato
    mov w1, w1             // Primer argumento (%d)
    mov w2, w2             // Segundo argumento (%d)
    mov w3, w3             // Tercer argumento (%d)
    bl printf              // Llamada a printf

    // Salida del programa
    mov x8, #93            // syscall: exit
    svc 0
