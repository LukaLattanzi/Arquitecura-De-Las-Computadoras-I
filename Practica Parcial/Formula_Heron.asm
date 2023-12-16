.data
ladoUno: .word 10 # Lado A del triangulo
ladoDos: .word 15 # Lado B del triangulo
ladoTres: .word 20 # Lado C del triangulo
areaTriangulo: .space 4 # Espacio para almacenar el resultado

.text
main:
	
	lw $a1, ladoUno # Cargamos el lado A en $a1
	lw $a2, ladoDos # Cargamos el lado B en $a2
	lw $a3, ladoTres # Cargamos el lado C en $a3
	
	jal heron # Llamamos a la funcion para calcular el area del triangulo
	
	move $a0, $v0 # Pasamos el resultado al $a0
	li $v0, 1 # Imprimimos el resultado
	syscall
	
	li $v0, 10 # Terminar ejecucion 
	syscall
	
heron:
	
	add $t1, $a1, $a2 # Sumamos el lado A con el lado B y lo guardamos en $t1
	add $t1, $t1, $a3 # Sumamos el lado C al $t1
	
	li $t0, 2 # Cargamos el 2 en el $t0
	
	div $t1, $t0 # Divido la suma de los lados ($t1) por 2 ($t0)
	
	mflo $v0 # Pasamos el resultado de la divion a $v0
	
	sw $v0, areaTriangulo # Guardamos el resultado en el .data
	
	jr $ra # Sale de la funcion y devuelve el $v0


	
	
	
