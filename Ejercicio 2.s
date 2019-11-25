# A = R4 = A
# BC = R5
# DE = R6
# HL = R7 = $v0
# IX = R8 = $a0
# IY = R9 = $a1

.data
	vector: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
	sumav:
		push IX		#Push $a0
		push IY		#Push $a1

		ldi HL 0	#li $v0

		b1:
			ldi A 0	#ponemos A a 0
			add_a IX	#A + v0
			jpz f1		#PREGUNTAR EN CLASE SI ES LEGITIMO, comprobar si la suma es 0
			ld BC (IY)	#ponemos R5 (PREGUNTAR SI R5 ES $t0) al valor de la posicion en memoria de R9
			ld A HL	#movemos a A v0
			add_a BC	#A + R5
			ld HL A 	#movemos a v0 A
			ld A IY	#movemos a A a1
			addi_a 4	#A + 4
			ld IY A	#movemos a a1 A
			dec IX		#a0 - 1
			jp b1		#reiterar
		f1:
			pop IY		#Pop $a1
			pop IX		#Pop $a0
			ret 		#RETURN

	main:
		ldi IX 10
		ldi IY vector
		call sumav
		halt
		