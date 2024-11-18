// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Implementar una Cola Usando un Arreglo
// Concepto/Temática: Estructuras de datos
// Dificultad: Difícil
// Tiempo Estimado: 40-50 minutos
// Aplicación Práctica: Manejo de datos y memoria
// =====================================================================================

/*
Solución en Python:
# Implementar una cola
queue = []
queue.append(1)  # Enqueue
queue.append(2)  # Enqueue
front = queue.pop(0)  # Dequeue
*/

.section .data
queue: .skip 40  // Espacio para 10 enteros (4 bytes cada uno)
front: .word 0   // Posición frontal
rear: .word 0    // Posición trasera

.section .text
.global _start
_start:
    // Enqueue 1
    ldr w0, =queue
    ldr w1, =rear
    ldr w2, [w1]
    str w2, [w1]          // Incrementar rear
    mov w3, #1
    str w3, [w0, w2, lsl #2]  // Almacenar valor en la cola

    // Enqueue 2
    ldr w3, #2
    add w2, w2, #1
    str w2, [w1]          // Incrementar rear
    str w3, [w0, w2, lsl #2]  // Almacenar valor en la cola

    // Dequeue
    ldr w2, [front]       // Cargar la posición frontal
    ldr w3, [w0, w2, lsl #2]  // Obtener el valor del frente
    add w2, w2, #1
    str w2, [front]       // Incrementar el frente

    // El valor en el frente está en w3
    mov x8, #93
    mov x0, #0
    svc 0
