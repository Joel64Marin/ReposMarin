// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Búsqueda lineal
// Concepto/Temática: Búsqueda en arreglos
// Dificultad: Intermedia
// Tiempo Estimado: 20-30 minutos
// Aplicación Práctica: Recuperación de información
// =====================================================================================

/*
Solución en Python:
# Búsqueda lineal
arreglo = [3, 1, 4, 1, 5, 9, 2]
valor = 5
encontrado = False
for i in arreglo:
    if i == valor:
        encontrado = True
        break
print(f"Valor encontrado: {encontrado}")
*/

.section .data
arreglo:    .word 3, 1, 4, 1, 5, 9, 2
tam:        .word 7
valor:      .word 5
msg_si:     .asciz "Valor encontrado\n"
msg_no:     .asciz "Valor no encontrado\n"

.section .text
.global _start
_start:
    ldr x0, =arreglo
    ldr w1, =tam
    ldr w1, [w1]
    ldr w2, =valor
    ldr w2, [w2]

search:
    ldr w3, [x0]          // Leer elemento actual
    cmp w3, w2            // Comparar con el valor buscado
    beq encontrado
    add x0, x0, #4        // Siguiente elemento
    subs w1, w1, #1       // Decrementar contador
    bne search

no_encontrado:
    adr x0, msg_no
    b imprimir

encontrado:
    adr x0, msg_si

imprimir:
    bl printf
    mov x8, #93
    svc 0
