// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Ordenamiento por Selección
// Concepto/Temática: Algoritmos de Ordenamiento
// Dificultad: Intermedia
// Tiempo Estimado: 40-50 minutos
// Aplicación Práctica: Optimización y organización de datos
// =====================================================================================

/*
Solución en Python:
# Ordenamiento por Selección
def selection_sort(arr):
    for i in range(len(arr)):
        min_idx = i
        for j in range(i+1, len(arr)):
            if arr[j] < arr[min_idx]:
                min_idx = j
        arr[i], arr[min_idx] = arr[min_idx], arr[i]
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
    
    mov w2, #0                  // i = 0
    
selection_loop_i:
    cmp w2, w1                  // if i >= tam
    bge end_selection_sort

    mov w3, w2                  // min_idx = i
    add w4, w2, #1              // j = i + 1

selection_loop_j:
    cmp w4, w1                  // if j >= tam
    bge swap_values

    ldr w5, [x0, w4, lsl #2]    // arr[j]
    ldr w6, [x0, w3, lsl #2]    // arr[min_idx]
    cmp w5, w6
    bge next_j

    mov w3, w4                  // min_idx = j

next_j:
    add w4, w4, #1
    b selection_loop_j

swap_values:
    ldr w5, [x0, w2, lsl #2]    // arr[i]
    ldr w6, [x0, w3, lsl #2]    // arr[min_idx]
    str w6, [x0, w2, lsl #2]    // arr[i] = arr[min_idx]
    str w5, [x0, w3, lsl #2]    // arr[min_idx] = arr[i]

    add w2, w2, #1
    b selection_loop_i

end_selection_sort:
    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
