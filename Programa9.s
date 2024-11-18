// =====================================================================================
// Programador: Joel Adrian Marin Arce
// Número de Control: 21211986
// Nombre del Programa: Verificar si un número es primo
// Concepto/Temática: Saltos condicionales
// Dificultad: Intermedia
// Tiempo Estimado: 30-40 minutos
// Aplicación Práctica: Criptografía, teoría de números
// =====================================================================================

/*
Solución en Python:
# Verificar si un número es primo
n = 29
es_primo = True
for i in range(2, int(n**0.5) + 1):
    if n % i == 0:
        es_primo = False
        break
print(f"El número {n} {'es primo' if es_primo else 'no es primo'}")
*/

.section .data
n:      .word 29
msg_primo:    .asciz "El número %d es primo\n"
msg_no_primo
