# A = R4 = $4
# BC = R5
# DE = R6
# HL = R7 = $v0
# IX = R8 = $a0
# IY = R9 = $a1



.data
	vector: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
	sumav:
		push $8		#Push $a0
		push $9		#Push $a1

		ldi $7 0	#li $v0

		b1:
			ldi $4 0	#ponemos A a 0
			add_a $8	#A + v0
			jpz 36		#PREGUNTAR EN CLASE SI ES LEGITIMO, comprobar si la suma es 0
			ld $5 ($9)	#ponemos R5 (PREGUNTAR SI R5 ES $t0) al valor de la posicion en memoria de R9
			ld $4 $7	#movemos a A v0
			add_a $5	#A + R5
			ld $7 $4 	#movemos a v0 A
			ld $4 $9	#movemos a A a1
			addi_a 4	#A + 4
			ld $9 $4	#movemos a a1 A
			dec $8		#a0 - 1
			jp -48		#reiterar
		f1:
			pop $9		#Pop $a1
			pop $8		#Pop $a0
			ret 		#RETURN

	main:
		ldi $8 10
		ldi $9 vector
		call sumav
		halt
		