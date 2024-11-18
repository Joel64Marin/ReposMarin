// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Generación de Números Aleatorios (con Semilla)
// Concepto/Temática: Generación de números pseudoaleatorios
// Dificultad: Difícil
// Tiempo Estimado: 40-50 minutos
// Aplicación Práctica: Juegos y simulaciones
// =====================================================================================

/*
Solución en Python:
# Generación de números aleatorios con semilla
import random
random.seed(1234)
random_number = random.randint(1, 100)
*/

.section .data
seed: .word 1234   // Semilla para el generador
max_val: .word 100 // Valor máximo para el rango

.section .text
.global _start
_start:
    ldr w0, =seed
    ldr w0, [w0]      // Cargar la semilla

    // Generar un número aleatorio simple con una fórmula pseudoaleatoria
    mul w1, w0, #0x41C64E6D  // Parte de la fórmula multiplicativa
    add w1, w1, #0x3039     // Desplazamiento constante
    and w1, w1, #0xFFFFFFF  // Limitar el valor

    ldr w2, =max_val
    ldr w2, [w2]      // Cargar el valor máximo
    udiv w1, w1, w2   // Reducir al rango

    // El número aleatorio está en w1
    mov x8, #93
    mov x0, #0
    svc 0
