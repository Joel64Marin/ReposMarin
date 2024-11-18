// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Encontrar Prefijo Común Más Largo en Cadenas
// Concepto/Temática: Comparación de cadenas
// Dificultad: Intermedia
// Tiempo Estimado: 25-35 minutos
// Aplicación Práctica: Comparación de textos
// =====================================================================================

/*
Solución en Python:
# Encontrar el prefijo común más largo
str1 = "flower"
str2 = "flow"
str3 = "flight"
prefix = ""
for i in range(min(len(str1), len(str2), len(str3))):
    if str1[i] == str2[i] == str3[i]:
        prefix += str1[i]
    else:
        break
print(f"Prefijo común más largo: {prefix}")
*/

.section .data
str1: .asciz "flower"
str2: .asciz "flow"
str3: .asciz "flight"

.section .text
.global _start
_start:
    ldr x0, =str1
    ldr x1, =str2
    ldr x2, =str3

    mov x3, #0        // Índice
    mov x4, #0        // Longitud del prefijo

find_prefix:
    ldrb w5, [x0, x3] // Cargar el siguiente carácter de str1
    ldrb w6, [x1, x3] // Cargar el siguiente carácter de str2
    ldrb w7, [x2, x3] // Cargar el siguiente carácter de str3
    cmp w5, w6
    bne end_prefix    // Si los caracteres no coinciden, terminar
    cmp w5, w7
    bne end_prefix    // Si los caracteres no coinciden, terminar
    add x4, x4, #1    // Incrementar la longitud del prefijo
    add x3, x3, #1    // Avanzar al siguiente índice
    b find_prefix

end_prefix:
    // El prefijo común más largo está en x4
    mov x8, #93
    mov x0, #0
    svc 0
