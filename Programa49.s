// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Leer Entrada desde el Teclado
// Concepto/Temática: I/O y llamadas al sistema
// Dificultad: Fácil
// Tiempo Estimado: 15-20 minutos
// Aplicación Práctica: Interacción con el usuario
// =====================================================================================

/*
Solución en Python:
# Leer entrada desde el teclado
user_input = input("Introduce algo: ")
print(f"Has introducido: {user_input}")
*/

.section .data
prompt: .asciz "Introduce algo: "
buffer: .space 128

.section .text
.global _start
_start:
    // Mostrar mensaje
    adr x0, prompt
    bl printf

    // Leer entrada desde el teclado
    mov x0, #0      // Descriptor de archivo para stdin
    adr x1, buffer  // Dirección del buffer
    mov x2, #128    // Tamaño máximo
    mov x8, #63     // Syscall para leer
    svc 0

    // Mostrar lo que se ha introducido
    adr x0, buffer
    bl printf
    mov x8, #93
    mov x0, #0
    svc 0
