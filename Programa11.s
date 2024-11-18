// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Verificar si una cadena es palíndromo
// Concepto/Temática: Flujo de control y manejo de cadenas
// Dificultad: Intermedia
// Tiempo Estimado: 20-30 minutos
// Aplicación Práctica: Análisis de palabras, juegos de palabras
// =====================================================================================

/*
Solución en Python:
# Verificar si una cadena es palíndromo
cadena = "radar"
es_palindromo = cadena == cadena[::-1]
print(f"La cadena {'es' if es_palindromo else 'no es'} un palíndromo")
*/

.section .data
cadena:      .asciz "radar"
msg_pal:     .asciz "La cadena es un palíndromo\n"
msg_no_pal:  .asciz "La cadena no es un palíndromo\n"

.section .text
.global _start
_start:
    adr x0, cadena        // Dirección de la cadena original
    ldr x1, =cadena       // Reutiliza como final
    mov w2, #0            // Contador inicio
    mov w3, #0            // Contador
---
Do you want code snippets for all programs or assistance 1 by 1 optimization. Please clarify
