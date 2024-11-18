// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Suma de Matrices
// Concepto/Temática: Operaciones con arreglos 2D
// Dificultad: Intermedia
// Tiempo Estimado: 30-40 minutos
// Aplicación Práctica: Procesamiento de imágenes
// =====================================================================================

/*
Solución en Python:
# Suma de Matrices
def matrix_addition(A, B):
    result = [[A[i][j] + B[i][j] for j in range(len(A[0]))] for i in range(len(A))]
    return result
*/

.section .data
matrix_a:   .word 1, 2, 3, 4
matrix_b:   .word 5, 6, 7, 8
result:     .space 8          // Espacio para la matriz resultante (2x2)

.section .text
.global _start
_start:
    // Cargar las matrices A y B, y realizar la suma de matrices
    ldr x0, =matrix_a
    ldr x1, =matrix_b
    ldr x2, =result

    // Asumiendo matrices 2x2 para simplificación
    ldr w3, [x0]    // Cargar A[0]
    ldr w4, [x1]    // Cargar B[0]
    add w5, w3, w4  // A[0] + B[0]
    str w5, [x2]    // Guardar en result[0]

    ldr w3, [x0, #4]  // Cargar A[1]
    ldr w4, [x1, #4]  // Cargar B[1]
    add w5, w3, w4    // A[1] + B[1]
    str w5, [x2, #4]  // Guardar en result[1]

    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
