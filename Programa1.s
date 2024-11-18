// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Convertir temperatura de Celsius a Fahrenheit
// Concepto/Temática: Conversión de unidades, manejo de I/O
// Dificultad: Fácil
// Tiempo Estimado: 15-20 minutos
// Aplicación Práctica: Dispositivos de monitoreo ambiental
// =====================================================================================

/*
Solución en Python:
celsius = 25.0
fahrenheit = (celsius * 9 / 5) + 32
print(f"Fahrenheit: {fahrenheit:.2f}")
*/

// Código ARM64 Assembly
.section .data
celsius: .float 25.0
msg: .asciz "Fahrenheit: %.2f\n"

.section .text
.global _start
_start:
    // Cargar valor de Celsius
    adr x0, celsius
    ldr s0, [x0]

    // Realizar conversión (C * 9 / 5) + 32
    fmov s1, #9.0
    fmul s0, s0, s1
    fmov s1, #5.0
    fdiv s0, s0, s1
    fmov s1, #32.0
    fadd s0, s0, s1

    // Imprimir resultado
    adr x0, msg
    fmov d0, s0
    bl printf

    // Salida
    mov x8, #93 // syscall exit
    svc 0

