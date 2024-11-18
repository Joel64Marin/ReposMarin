// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Conversión de Hexadecimal a Decimal
// Concepto/Temática: Conversión de datos
// Dificultad: Intermedia
// Tiempo Estimado: 25-30 minutos
// Aplicación Práctica: Conversión de datos
// =====================================================================================

/*
Solución en Python:
# Convertir hexadecimal a decimal
hexadecimal = "7B"
decimal = int(hexadecimal, 16)
*/

.section .data
hexadecimal: .asciz "7B"   // Número hexadecimal como cadena

.section .text
.global _start
_start:
    ldr x0, =hexadecimal
    mov w1, #0        // Inicializar el resultado decimal
    mov w2, #1        // Factor para cada posición (16^n)

convert_loop:
    ldrb w3, [x0]     // Cargar el siguiente carácter
    cmp w3, #0        // Fin de la cadena
    beq end_convert
    sub w3, w3, #48   // Convertir carácter ASCII a número (0-9)
    cmp w3, #9
    ble valid_digit
    sub w3, w3, #7    // Convertir A-F a valores 10-15

valid_digit:
    mul w1, w1, #16   // Multiplicar el resultado por 16
    add w1, w1, w3    // Agregar el valor al resultado
    add x0, x0, #1    // Avanzar al siguiente carácter
    b convert_loop

end_convert:
    // El número decimal está en w1
    mov x8, #93
    mov x0, #0
    svc 0
