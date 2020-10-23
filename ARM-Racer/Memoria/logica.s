		MOV		r0,#1024
		MOV		r2,#280
		
inicio
		LDR		r1,[r0,#12]
		CMP		r1,#1
		
		BLT		inicio
		BGT		derecha
		
izquierda
		CMP		r2,#120
		SUBGE	r2,r2,#20
		B		final
		
derecha
		CMP		r2,#520
		ADDLE	r2,r2,#20
		B		final
		
final
		STR		r2,[r0]
		MOV		r1,#0
		
		B		inicio
