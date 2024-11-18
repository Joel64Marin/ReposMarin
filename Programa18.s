// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Ordenamiento por Mezcla
// Concepto/Temática: Recursión y manejo de memoria
// Dificultad: Difícil
// Tiempo Estimado: 50-60 minutos
// Aplicación Práctica: Ordenamiento eficiente de grandes datos
// =====================================================================================

/*
Solución en Python:
# Merge Sort
def merge_sort(arr):
    if len(arr) > 1:
        mid = len(arr) // 2
        left_half = arr[:mid]
        right_half = arr[mid:]

        merge_sort(left_half)
        merge_sort(right_half)

        i = j = k = 0
        while i < len(left_half) and j < len(right_half):
            if left_half[i] < right_half[j]:
                arr[k] = left_half[i]
                i += 1
            else:
                arr[k] = right_half[j]
                j += 1
            k += 1

        while i < len(left_half):
            arr[k] = left_half[i]
            i += 1
            k += 1

        while j < len(right_half):
            arr[k] = right_half[j]
            j += 1
            k += 1
    return arr
*/

.section .data
arreglo:    .word 5, 3, 8, 4, 2
tam:        .word 5

.section .text
.global _start
_start:
    // Aquí iría la implementación recursiva de Merge Sort en ARM64
    // La recursión requiere trabajar con divisiones y llamadas a funciones
    
    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
