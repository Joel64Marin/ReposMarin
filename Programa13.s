// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Encontrar el mínimo en un arreglo
// Concepto/Temática: Recorrido de arreglos
// Dificultad: Intermedia
// Tiempo Estimado: 25-35 minutos
// Aplicación Práctica: Análisis de datos, búsqueda de valores
// =====================================================================================

/*
Solución en Python:
# Encontrar el mínimo en un arreglo
arreglo = [3, 1, 4, 1, 5, 9, 2]
minimo = min(arreglo)
print(f"El mínimo valor es {minimo}")
*/

.section .data
arreglo:    .word 3, 1, 4, 1, 5, 9, 2
tam:        .word 7
msg:        .asciz "El mínimo valor es %d\n"

.section .text
.global _start
_start:
    ldr x0, =arreglo      // Puntero al arreglo
    ldr w1, =tam          // Tamaño del arreglo
    ldr w1, [w1]
    ldr w2, [x0]          // Mínimo inicial: primer elemento
    add x0, x0, #4        // Mover al siguiente elemento
    subs w1, w1, #1       // Reducir tamaño

find_min:
    ldr w3, [x0]          // Leer elemento actual
    cmp w3, w2            // Comparar con el mínimo actual
    blt update_min
    b next_elem

update_min:
    mov w2, w3            // Actualizar mínimo

next_elem:
    add x0, x0, #4        // Siguiente elemento
    subs w1, w1, #1       // Decrementar contador
    bne find_min

// Imprimir resultado
    adr x0, msg
    mov w1, w2
    bl printf

// Salida
    mov x8, #93
    svc 0
