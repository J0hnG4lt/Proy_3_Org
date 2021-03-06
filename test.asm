# Estudiantes: Georvic Tur    --- Carnet: 12-11402
#	       Ronald Becerra --- Carnet: 12-10706

# Nota importante: archivo original usado como esqueleto para la implementacion de un manejador de interrupciones.
#                  El esqueleto se puede encontrar en la pagina del curso
#		   Indicamos en comentarios el codigo del archivo original
#                  Hay dos bloques de codigo que estaban en el esqueleto
#		   Entre ellos se ha escrito el codigo del manejador
#                  Al final del kdata se han anadido mas variables
       
##################################################################################################################
########################################## Esqueleto Inicio ######################################################
################################################################################################################## 
      
       .data
mes01: .asciiz "El resultado de la suma es "
salto: .asciiz "\n"
datos: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
n:     .word 20
mes02: .asciiz "Comenzo a ejecutar el programa de prueba\n"
       .text
main:	

##################################################################################################################
########################################## Esqueleto Fin  ########################################################
##################################################################################################################

	teq $zero, $zero # Habilito el receiver y transmitter
			 # Por la manera en que se hizo el reloj, no hace 
			 # falta inicializar en esta ocasion el reloj como lo
			 # dice el enunciado del proyecto


	
##################################################################################################################
########################################## Esqueleto Inicio ######################################################
##################################################################################################################
	
	li  	$v0, 4
	la	$a0, mes02
	syscall
ini:	lw	$t0, n		   # Numero de elementos en el arreglo
	la	$t1, datos	   # Direccion de inicio del arreglo
	li 	$v1, 0
	beqz 	$t0, fin
lazo:	lw 	$t2, 0($t1)	   # Carga el i-esimo elemento
	add 	$v1, $v1, $t2	   # Acumula
	addi 	$t0, $t0, -1
	addi 	$t1, $t1, 4
	move  $t3, $v1		   # Numero de veces que se va a ejecutar
	mul   $t3, $t3, 1000	   # el lazo de retardo antes de sumar el
retardo:			   # siguiente elemento del arreglo
	addi	$t3, $t3, -1
	bgtz	$t3, retardo
	bnez	$t0, lazo
fin:	li 	$v0, 4	 	   # Imprime mensaje de resultado
	la	$a0, ,mes01
	syscall
	li 	$v0, 1		   # Imprime el resultado
	move	$a0, $v1
	syscall
	li 	$v0, 4
	la	$a0, salto
	syscall
	
##################################################################################################################
########################################## Esqueleto Fin  ########################################################
##################################################################################################################
	
	
	b ini			   # Itera indefinidamente
	
