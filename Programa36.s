// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Encontrar el Segundo Elemento Más Grande
// Concepto/Temática: Comparación en arreglos
// Dificultad: Intermedia
// Tiempo Estimado: 25-35 minutos
// Aplicación Práctica: Análisis de datos
// =====================================================================================

/*
Solución en Python:
# Encontrar el segundo elemento más grande
arr = [10, 20, 4, 45, 99]
arr.sort()
second_largest = arr[-2]
*/

.section .data
arr: .word 10, 20, 4, 45, 99
len_arr: .word 5

.section .text
.global _start
_start:
    ldr w0, =arr            // Dirección del arreglo
    ldr w1, =len_arr        // Dirección del tamaño del arreglo
    ldr w1, [w1]            // Cargar el tamaño del arreglo
    mov w2, #0              // Primer mayor
    mov w3, #0              // Segundo mayor

find_second_largest:
    cmp w1, #0
    beq end_find
    ldr w4, [w0], #4        // Cargar el siguiente elemento
    cmp w4, w2
    ble check_second
    mov w3, w2              // Actualizar segundo mayor
    mov w2, w4              // Actualizar mayor

check_second:
    cmp w4, w3
    ble next_element
    mov w3, w4              // Actualizar segundo mayor

next_element:
    subs w1, w1, #1         // Decrementar el tamaño
    b find_second_largest

end_find:
    // El segundo mayor está en w3
    mov x8, #93
    mov x0, #0
    svc 0
