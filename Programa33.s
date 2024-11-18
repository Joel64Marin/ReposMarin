// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Suma de Elementos en un Arreglo
// Concepto/Temática: Recorrido de arreglos
// Dificultad: Fácil
// Tiempo Estimado: 15-20 minutos
// Aplicación Práctica: Estadísticas simples
// =====================================================================================

/*
Solución en Python:
# Suma de elementos en un arreglo
arr = [1, 2, 3, 4, 5]
total = sum(arr)
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
    mov w2, #0            // Inicializar la suma en 0

sum_loop:
    cmp w1, #0            // Verificar si hemos recorrido todo el arreglo
    beq end_sum
    ldr w3, [w0], #4      // Cargar el siguiente elemento y avanzar en el arreglo
    add w2, w2, w3        // Sumar el valor al acumulador
    subs w1, w1, #1       // Decrementar el contador
    b sum_loop

end_sum:
    // El resultado está en w2
    mov x8, #93
    mov x0, #0
    svc 0
