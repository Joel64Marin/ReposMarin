// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Medir el Tiempo de Ejecución de una Función
// Concepto/Temática: Operaciones con temporizadores
// Dificultad: Difícil
// Tiempo Estimado: 40-50 minutos
// Aplicación Práctica: Optimización de código
// =====================================================================================

/*
Solución en Python:
# Medir el tiempo de ejecución
import time
start_time = time.time()
# Código de la función
end_time = time.time()
print(f"Tiempo de ejecución: {end_time - start_time} segundos")
*/

.section .data
msg: .asciz "Tiempo de ejecución: %f segundos\n"

.section .text
.global _start
_start:
    // Marcar el tiempo de inicio
    mrs x0, CNTVCT_EL0  // Obtener el contador de ciclos
    mov x1, #0          // Placeholder para el tiempo de inicio

    // Ejecutar la función
    // Aquí se puede colocar el código de la función que se va a medir

    // Marcar el tiempo de finalización
    mrs x2, CNTVCT_EL0  // Obtener el contador de ciclos al final

    // Calcular el tiempo de ejecución (diferencia de ciclos)
    sub x3, x2, x0      // Calcular la diferencia
    // El resultado está en x3, se puede convertir a segundos si es necesario

    // Imprimir el resultado (se puede convertir el valor a un formato legible)
    adr x0, msg
    bl printf
    mov x8, #93
    mov x0, #0
    svc 0
