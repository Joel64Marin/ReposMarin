// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Conversión de ASCII a Entero
// Concepto/Temática: Conversión de tipos de datos
// Dificultad: Fácil
// Tiempo Estimado: 15-20 minutos
// Aplicación Práctica: Validación de entradas
// =====================================================================================

/*
Solución en Python:
# Conversión de ASCII a Entero
def ascii_to_int(ascii_char):
    return ord(ascii_char) - ord('0')
*/

.section .data
ascii_char:   .byte '7'  // Caracter ASCII '7'

.section .text
.global _start
_start:
    ldrb w0, [ascii_char]    // Cargar el carácter ASCII
    sub w0, w0, #'0'         // Convertir ASCII a entero (restando valor de '0')

    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
