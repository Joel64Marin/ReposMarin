// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Contar Vocales y Consonantes
// Concepto/Temática: Análisis de cadenas
// Dificultad: Intermedia
// Tiempo Estimado: 20-30 minutos
// Aplicación Práctica: Análisis de textos
// =====================================================================================

/*
Solución en Python:
# Contar Vocales y Consonantes
def count_vowels_consonants(text):
    vowels = "aeiouAEIOU"
    vowels_count = sum(1 for char in text if char in vowels)
    consonants_count = sum(1 for char in text if char.isalpha() and char not in vowels)
    return vowels_count, consonants_count
*/

.section .data
texto:      .asciz "Hola Mundo"
vocales:    .word 0
consonantes:.word 0

.section .text
.global _start
_start:
    ldr x0, =texto            // Cargar la dirección del texto
    mov w1, #0                // Contador de vocales
    mov w2, #0                // Contador de consonantes

count_loop:
    ldrb w3, [x0]             // Leer el siguiente carácter
    cmp w3, #0                // Verificar si es el final de la cadena
    beq end_count             // Si es nulo, terminar

    // Comprobar si el carácter es una vocal
    cmp w3, #'a'              // Comprobar si es una vocal minúscula
    beq increment_vowel
    cmp w3, #'e'
    beq increment_vowel
    cmp w3, #'i'
    beq increment_vowel
    cmp w3, #'o'
    beq increment_vowel
    cmp w3, #'u'
    beq increment_vowel

    cmp w3, #'A'              // Comprobar si es una vocal mayúscula
    beq increment_vowel
    cmp w3, #'E'
    beq increment_vowel
    cmp w3, #'I'
    beq increment_vowel
    cmp w3, #'O'
    beq increment_vowel
    cmp w3, #'U'
    beq increment_vowel

    // Si no es una vocal, es consonante
    add w2, w2, #1            // Incrementar consonantes
    b next_char

increment_vowel:
    add w1, w1, #1            // Incrementar vocales

next_char:
    add x0, x0, #1            // Avanzar al siguiente carácter
    b count_loop

end_count:
    // Guardar resultados (solo un ejemplo)
    // Salir del programa
    mov x8, #93
    mov x0, #0
    svc 0
