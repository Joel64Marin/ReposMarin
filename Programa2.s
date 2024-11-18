// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Suma de dos números
// Concepto/Temática: Aritmética básica
// Dificultad: Fácil
// Tiempo Estimado: 10-15 minutos
// Aplicación Práctica: Calculadoras, operaciones simples
// =====================================================================================

/*
Solución en Python:
# Sumar dos números
a = 15
b = 25
suma = a + b
print(f"La suma de {a} y {b} es {suma}")
*/

// Inicio del programa en Assembly
.section .data
num1:   .word 15           // Primer número
num2:   .word 25           // Segundo número
msg:    .asciz "La suma de %d y %d es %d\n"

.section .text
.global _start
_start:
    // Cargar los números desde la memoria
    ldr w0, =num1          // Dirección del primer número
    ldr w1, [w0]           // Cargar el valor de num1 en w1
    ldr w0, =num2          // Dirección del segundo número
    ldr w2, [w0]           // Cargar el valor de num2 en w2

    // Sumar los números
    add w3, w1, w2         // w3 = w1 + w2

    // Preparar la llamada a printf
    adr x0, msg            // Dirección del mensaje de formato
    mov w1, w1             // Primer argumento (%d)
    mov w2, w2             // Segundo argumento (%d)
    mov w3, w3             // Tercer argumento (%d)
    bl printf              // Llamada a printf

    // Salida del programa
    mov x8, #93            // syscall: exit
    svc 0
