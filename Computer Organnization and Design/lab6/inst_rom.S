	lw $s0,255($0)
	lw $s1,255($0)
_while:
	add $t0,$s1,$s0
	add $s0,$s1,$0
	add $s1,$t0,$0
	j _while