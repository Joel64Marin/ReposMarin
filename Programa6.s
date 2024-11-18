// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Suma de los N primeros números naturales
// Concepto/Temática: Bucles y contadores
// Dificultad: Intermedia
// Tiempo Estimado: 20-30 minutos
// Aplicación Práctica: Series numéricas, cálculos financieros
// =====================================================================================

/*
Solución en Python:
# Suma de los N primeros números naturales
n = 10
suma = sum(range(1, n+1))
print(f"La suma de los primeros {n} números es {suma}")
*/

.section .data
n:      .word 10           // Número N
msg:    .asciz "La suma de los primeros %d números es %d\n"

.section .text
.global _start
_start:
    // Inicializar variables
    ldr w0, =n
    ldr w1, [w0]           // Número límite N
    mov w2, #1             // Contador
    mov w3, #0             // Acumulador

loop:
    add w3, w3, w2         // Sumar el contador al acumulador
    add w2, w2, #1         // Incrementar el contador
    cmp w2, w1             // Comparar contador con N
    ble loop               // Repetir si contador <= N

    // Imprimir resultado
    adr x0, msg
    mov w1, w1
    mov w2, w3
    bl printf

    // Salida
    mov x8, #93
    svc 0
