;键盘输入一个数字N(0<N<10)
;把1~N^2的自然数按行顺序存入二维数组
;在屏幕上打印出该数组的左下半三角

DATAS SEGMENT
	NUM DB  ?
	i DB 0
	j DB 0
	TEMP DB 0
	MES DB 10,13,'$'
	SPACE DB ' ','$'
DATAS  ENDS

CODES  SEGMENT
	ASSUME    CS:CODES,DS:DATAS

START:
	MOV AX, DATAS
	MOV DS, AX

;input Num
	MOV  AH, 01H
	INT  21H
	MOV NUM, AL
	SUB NUM, 30H

	LEA DX, MES
	MOV AH, 09H
	INT 21H

;print
	MOV i, 0
	MOV j, 0
	
	MOV AL, NUM
	MOV TEMP, AL
	MOV AL, i
	SUB TEMP, AL
	.WHILE TEMP > 0 ;if NUM > i
		MOV AL, NUM
		MOV TEMP, AL
		MOV AL, j
		SUB TEMP, AL
		.WHILE TEMP > 0 ;if NUM > j
			MOV AL, i
			MOV TEMP, AL
			MOV AL, j
			SUB TEMP, AL
			JC .Lable1 ;if i >= j
				MOV AL, NUM
				MUL i
				MOV DH, 0
				MOV DL, j
				ADD AX, DX
				INC AX ;i*NUM+j+1
				MOV DL, 0AH
				DIV DL
				MOV DL, AL
				MOV DH, AH

				SUB DL, 0
				JZ .Lable2
				ADD DL, 30H
				MOV AH, 02H
				INT 21H
				.Lable2:
				MOV DL, DH
				ADD DL, 30H
				MOV AH, 02H
				INT 21H
				LEA DX, SPACE
				MOV AH, 09H
				INT 21H
			.Lable1:			
			INC j
			MOV AL, NUM
			MOV TEMP, AL
			MOV AL, j
			SUB TEMP, AL
		.ENDW
		LEA DX, MES
		MOV AH, 09H
		INT 21H
		MOV j, 0
		INC i
		MOV AL, NUM
		MOV TEMP, AL
		MOV AL, i
		SUB TEMP, AL
	.ENDW

;exit
	MOV  AX, 4C00H
	INT  21H
CODES  ENDS
END   START
