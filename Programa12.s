// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Encontrar el máximo en un arreglo
// Concepto/Temática: Recorrido de arreglos
// Dificultad: Intermedia
// Tiempo Estimado: 25-35 minutos
// Aplicación Práctica: Análisis de datos, búsqueda de valores
// =====================================================================================

/*
Solución en Python:
# Encontrar el máximo en un arreglo
arreglo = [3, 1, 4, 1, 5, 9, 2]
maximo = max(arreglo)
print(f"El máximo valor es {maximo}")
*/

.section .data
arreglo:    .word 3, 1, 4, 1, 5, 9, 2
tam:        .word 7
msg:        .asciz "El máximo valor es %d\n"

.section .text
.global _start
_start:
    // Inicializar punteros y variables
    ldr x0, =arreglo      // Puntero al arreglo
    ldr w1, =tam          // Tamaño del arreglo
    ldr w1, [w1]
    ldr w2, [x0]          // Máximo inicial: primer elemento
    add x0, x0, #4        // Mover al siguiente elemento
    subs w1, w1, #1       // Reducir tamaño

find_max:
    ldr w3, [x0]          // Leer elemento actual
    cmp w3, w2            // Comparar con el máximo actual
    bgt update_max
    b next_elem

update_max:
    mov w2, w3            // Actualizar máximo

next_elem:
    add x0, x0, #4        // Siguiente elemento
    subs w1, w1, #1       // Decrementar contador
    bne find_max

// Imprimir resultado
    adr x0, msg
    mov w1, w2
    bl printf

// Salida
    mov x8, #93
    svc 0
