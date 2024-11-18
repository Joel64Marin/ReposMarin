// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Transposición de una Matriz
// Concepto/Temática: Manipulación de arreglos
// Dificultad: Intermedia
// Tiempo Estimado: 25-35 minutos
// Aplicación Práctica: Procesamiento de datos
// =====================================================================================

/*
Solución en Python:
# Transposición de una Matriz
def transpose_matrix(matrix):
    return [list(row) for row in zip(*matrix)]
*/

.section .data
matrix:     .word 1, 2, 3, 4, 5, 6
rows:       .word 2
cols:       .word 3
result:     .space 12        // Espacio para la matriz transpuesta 3x2

.section .text
.global _start
_start:
    ldr x0, =matrix
    ldr w1, =rows
    ldr w2, =cols
    ldr w1, [w1]
    ldr w2, [w2]
    ldr x3, =result
    
    // Transponer la matriz 2x3 a 3x2
    mov w4, #0  // i = 0

transpose_loop_i:
    cmp w4, w1  // if i >= filas
    bge end_transpose

    mov w5, #0  // j = 0

transpose_loop_j:
    cmp w5, w2  // if j >= columnas
    bge increment_i

    ldr w6, [x0, w4, lsl #2]     // Leer el elemento en matriz[i][j]
    str w6, [x3, w5, lsl #2]     // Almacenar en result[j][i]
    
    add w5, w5, #1
    b transpose_loop_j

increment_i:
    add w4, w4, #1
    b transpose_loop_i

end_transpose:
    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
