// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Ordenamiento Burbuja
// Concepto/Temática: Algoritmos de Ordenamiento
// Dificultad: Intermedia
// Tiempo Estimado: 40-50 minutos
// Aplicación Práctica: Optimización y organización de datos
// =====================================================================================

/*
Solución en Python:
# Ordenamiento Burbuja
def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n-i-1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]
    return arr
*/

.section .data
arreglo:    .word 5, 3, 8, 4, 2
tam:        .word 5

.section .text
.global _start
_start:
    ldr x0, =arreglo
    ldr w1, =tam
    ldr w1, [w1]
    
    // Bubble sort
    mov w2, #0                  // i = 0
    
bubble_loop_i:
    cmp w2, w1                  // if i >= tam
    bge end_bubble_sort

    mov w3, #0                  // j = 0
    
bubble_loop_j:
    cmp w3, w1                  // if j >= tam - i - 1
    bge increment_i

    ldr w4, [x0, w3, lsl #2]    // arr[j]
    ldr w5, [x0, w3, lsl #2 + 4] // arr[j+1]
    cmp w4, w5
    ble skip_swap

    // Swap arr[j] and arr[j+1]
    str w5, [x0, w3, lsl #2]
    str w4, [x0, w3, lsl #2 + 4]

skip_swap:
    add w3, w3, #1
    b bubble_loop_j

increment_i:
    add w2, w2, #1
    b bubble_loop_i

end_bubble_sort:
    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
