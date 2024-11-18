// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Búsqueda binaria
// Concepto/Temática: Recursión y saltos
// Dificultad: Difícil
// Tiempo Estimado: 30-40 minutos
// Aplicación Práctica: Optimización en búsquedas, bases de datos
// =====================================================================================

/*
Solución en Python:
# Búsqueda binaria
arreglo = [1, 3, 4, 5, 7, 9, 11]
valor = 5
inicio, fin = 0, len(arreglo) - 1
encontrado = False
while inicio <= fin:
    medio = (inicio + fin) // 2
    if arreglo[medio] == valor:
        encontrado = True
        break
    elif arreglo[medio] < valor:
        inicio = medio + 1
    else:
        fin = medio - 1
print(f"Valor encontrado: {encontrado}")
*/

.section .data
arreglo:    .word 1, 3, 4, 5, 7, 9, 11
tam:        .word 7
valor:      .word 5
msg_si:     .asciz "Valor encontrado\n"
msg_no:     .asciz "Valor no encontrado\n"

.section .text
.global _start
_start:
    // Configuración inicial
    ldr x0, =arreglo
    ldr w1, =tam
    ldr w1, [w1]
    ldr w2, =valor
    ldr w2, [w2]
    mov w3, #0             // Inicio
    sub w4, w1, #1         // Fin (tam-1)

binary_search:
    cmp w3, w4             // Verificar rango
    bgt no_encontrado
    add w5, w3, w4
    asr w5, w5, #1         // Calcular medio
    ldr w6, [x0, w5, lsl #2] // Leer elemento medio
    cmp w6, w2
    beq encontrado         // Si son iguales
    blt ajustar_inicio
    b ajustar_fin

ajustar_inicio:
    add w3, w5, #1         // inicio = medio + 1
    b binary_search

ajustar_fin:
    sub w4, w5, #1         // fin = medio - 1
    b binary_search

no_encontrado:
    adr x0, msg_no
    b imprimir

encontrado:
    adr x0, msg_si

imprimir:
    bl printf
    mov x8, #93
    svc 0
