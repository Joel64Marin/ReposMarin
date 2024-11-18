// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Multiplicación de Matrices
// Concepto/Temática: Bucles anidados, operaciones en memoria
// Dificultad: Difícil
// Tiempo Estimado: 50-60 minutos
// Aplicación Práctica: Modelado matemático, gráficos por computadora
// =====================================================================================

/*
Solución en Python:
# Multiplicación de Matrices
def matrix_multiplication(A, B):
    result = [[sum(A[i][k] * B[k][j] for k in range(len(B))) for j in range(len(B[0]))] for i in range(len(A))]
    return result
*/

.section .data
matrix_a:   .word 1, 2, 3, 4
matrix_b:   .word 5, 6, 7, 8
result:     .space 8

.section .text
.global _start
_start:
    // Cargar las matrices A y B
    ldr x0, =matrix_a
    ldr x1, =matrix_b
    ldr x2, =result

    // Multiplicación de matrices 2x2 por 2x2
    ldr w3, [x0]         // A[0][0]
    ldr w4, [x1]         // B[0][0]
    mul w5, w3, w4       // A[0][0] * B[0][0]
    
    ldr w3, [x0, #4]     // A[0][1]
    ldr w4, [x1, #4]     // B[1][0]
    mul w6, w3, w4       // A[0][1] * B[1][0]
    
    add w7, w5, w6       // Sumar los productos
    str w7, [x2]         // Guardar en result[0][0]

    // Calcular el resto de la matriz multiplicada...
    // Aquí va el resto de los cálculos para las otras posiciones

    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
