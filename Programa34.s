// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Invertir los Elementos de un Arreglo
// Concepto/Temática: Manipulación de arreglos
// Dificultad: Intermedia
// Tiempo Estimado: 25-30 minutos
// Aplicación Práctica: Procesamiento de datos
// =====================================================================================

/*
Solución en Python:
# Invertir los elementos de un arreglo
arr = [1, 2, 3, 4, 5]
arr.reverse()
*/

.section .data
arr: .word 1, 2, 3, 4, 5  // Arreglo de enteros
len_arr: .word 5          // Tamaño del arreglo

.section .text
.global _start
_start:
    ldr w0, =arr          // Dirección del arreglo
    ldr w1, =len_arr      // Dirección del tamaño del arreglo
    ldr w1, [w1]          // Cargar el tamaño del arreglo
    sub w1, w1, #1        // Índice final (len - 1)
    mov w2, #0            // Índice inicial

invert_loop:
    cmp w2, w1            // Comparar los índices
    bge end_invert
    ldr w3, [w0, w2, lsl #2]    // Cargar el elemento desde el inicio
    ldr w4, [w0, w1, lsl #2]    // Cargar el elemento desde el final
    str w3, [w0, w1, lsl #2]    // Colocar el valor en la posición final
    str w4, [w0, w2, lsl #2]    // Colocar el valor en la posición inicial
    add w2, w2, #1        // Incrementar el índice inicial
    sub w1, w1, #1        // Decrementar el índice final
    b invert_loop

end_invert:
    // El arreglo ha sido invertido
    mov x8, #93
    mov x0, #0
    svc 0
