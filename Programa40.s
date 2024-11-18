// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Convertir Binario a Decimal
// Concepto/Temática: Conversión, bucles
// Dificultad: Intermedia
// Tiempo Estimado: 25-30 minutos
// Aplicación Práctica: Conversión de datos
// =====================================================================================

/*
Solución en Python:
# Convertir binario a decimal
binary = "11101"
decimal = int(binary, 2)
*/

.section .data
binary: .asciz "11101"  // Número binario como cadena

.section .text
.global _start
_start:
    ldr x0, =binary
    mov w1, #0        // Inicializar el resultado decimal
    mov w2, #1        // Posición para cada bit

convert_loop:
    ldrb w3, [x0]     // Cargar el siguiente carácter
    cmp w3, #0        // Fin de la cadena
    beq end_convert
    sub w3, w3, #48   // Convertir carácter ASCII a número (0 o 1)
    mul w1, w1, #2    // Desplazar el resultado a la izquierda
    add w1, w1, w3    // Agregar el bit al resultado decimal
    add x0, x0, #1    // Avanzar al siguiente carácter
    b convert_loop

end_convert:
    // El número decimal está en w1
    mov x8, #93
    mov x0, #0
    svc 0
