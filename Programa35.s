// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Rotación de un Arreglo (Izquierda/Derecha)
// Concepto/Temática: Manipulación de arreglos
// Dificultad: Intermedia
// Tiempo Estimado: 25-35 minutos
// Aplicación Práctica: Algoritmos de criptografía
// =====================================================================================

/*
Solución en Python:
# Rotación de un arreglo (izquierda/derecha)
arr = [1, 2, 3, 4, 5]
k = 2  # Número de posiciones a rotar
arr = arr[k:] + arr[:k]  # Rotación hacia la izquierda
*/

.section .data
arr: .word 1, 2, 3, 4, 5  // Arreglo de enteros
len_arr: .word 5          // Tamaño del arreglo
k: .word 2               // Número de posiciones a rotar

.section .text
.global _start
_start:
    ldr w0, =arr          // Dirección del arreglo
    ldr w1, =len_arr      // Dirección del tamaño del arreglo
    ldr w1, [w1]          // Cargar el tamaño del arreglo
    ldr w2, =k            // Dirección del número de rotaciones
    ldr w2, [w2]          // Número de posiciones a rotar

    // Calcular el índice de inicio
    sub w3, w1, w2        // w3 = len - k

    // Rotación a la izquierda
    mov w4, w3            // Copiar el índice de inicio
    ldr w5, [w0, w4, lsl #2]   // Cargar el primer valor
    str w5, [w0]          // Colocar el primer valor en la primera posición

    // Mover los valores restantes
    add w4, w4, #1
    b loop_rotate

loop_rotate:
    cmp w4, w1
    bge end_rotate
    ldr w5, [w0, w4, lsl #2]
    str w5, [w0, w4, lsl #2]
    add w4, w4, #1
    b loop_rotate

end_rotate:
    // El arreglo ha sido rotado
    mov x8, #93
    mov x0, #0
    svc 0
