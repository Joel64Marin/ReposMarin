// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Invertir una cadena
// Concepto/Temática: Manipulación de cadenas
// Dificultad: Intermedia
// Tiempo Estimado: 20-30 minutos
// Aplicación Práctica: Aplicaciones en procesamiento de texto
// =====================================================================================

/*
Solución en Python:
# Invertir una cadena
cadena = "hello"
invertida = cadena[::-1]
print(f"Cadena invertida: {invertida}")
*/

.section .data
cadena:     .asciz "hello"
invertida:  .space 6
msg:        .asciz "Cadena invertida: %s\n"

.section .text
.global _start
_start:
    adr x0, cadena        // Dirección de la cadena original
    adr x1, invertida     // Dirección donde guardar la invertida
    mov w2, #0            // Contador para longitud

longitud:
    ldrb w3, [x0, w2]
    cbz w3, invertir      // Si llega al final, invertir
    add w2, w2, #1
    b longitud

invertir:
    sub w2, w2, #1        // Longitud - 1 para índices
    mov w4, #0            // Índice para la invertida
inv_loop:
    ldrb w3, [x0, w2]
    strb w3, [x1, w4]
    sub w2, w2, #1
    add w4, w4, #1
    cbz w2, imprimir

imprimir:
    adr x0, msg
    adr x1, invertida
    bl printf
    mov x8, #93
    svc 0
