// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Implementar una Pila Usando un Arreglo
// Concepto/Temática: Estructuras de datos
// Dificultad: Difícil
// Tiempo Estimado: 40-50 minutos
// Aplicación Práctica: Manejo de datos y memoria
// =====================================================================================

/*
Solución en Python:
# Implementar una pila
stack = []
stack.append(1)  # Push
stack.append(2)  # Push
top = stack.pop()  # Pop
*/

.section .data
stack: .skip 40  // Espacio para 10 enteros (4 bytes cada uno)
top: .word -1    // Indicador de la posición en la pila

.section .text
.global _start
_start:
    // Push 1
    ldr w0, =stack
    ldr w1, =top
    ldr w2, [w1]
    add w2, w2, #1
    str w2, [w1]          // Incrementar top
    mov w3, #1
    str w3, [w0, w2, lsl #2]  // Almacenar valor en la pila

    // Push 2
    ldr w3, #2
    add w2, w2, #1
    str w2, [w1]          // Incrementar top
    str w3, [w0, w2, lsl #2]  // Almacenar valor en la pila

    // Pop
    ldr w2, [w1]          // Cargar top
    ldr w3, [w0, w2, lsl #2]  // Obtener el valor del tope
    sub w2, w2, #1
    str w2, [w1]          // Decrementar top

    // El valor en el tope está en w3
    mov x8, #93
    mov x0, #0
    svc 0
