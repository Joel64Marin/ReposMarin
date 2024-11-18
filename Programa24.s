// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Calcular la Longitud de una Cadena
// Concepto/Temática: Manipulación de cadenas
// Dificultad: Fácil
// Tiempo Estimado: 10-15 minutos
// Aplicación Práctica: Procesamiento de texto
// =====================================================================================

/*
Solución en Python:
# Calcular la Longitud de una Cadena
def string_length(s):
    return len(s)
*/

.section .data
cadena:     .asciz "Hola Mundo"

.section .text
.global _start
_start:
    ldr x0, =cadena           // Cargar la dirección de la cadena
    mov w1, #0                // Contador de caracteres

count_loop:
    ldrb w2, [x0, w1]         // Leer el siguiente byte (carácter)
    cmp w2, #0                // Verificar si es el carácter nulo '\0'
    beq end_count             // Si es nulo, terminar
    add w1, w1, #1            // Incrementar el contador
    b count_loop

end_count:
    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
