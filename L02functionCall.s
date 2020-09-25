# C_code:
# g,h,i,j = a0,1,2,3
# f = $s0, result = $v0
# int leaf_example (int g, h, i, j){
#     int f;
#     f = (g + h) - ( i + j );
#     return f;
#     }
arithmaticExpressionEx:
# f = ( g + h ) - ( i + j ) ;
add      $t0, $s1, $s2      # $t0 = $s1 + $s2
add      $t1, $s3, $s4      # $t1 = $s3 + $s4
sub      $s0, $t0, $t1      # $s0 = $t0 - $t1

# 그러나 단순연산과 다른 것은, 조건이 있고 이전에 사용하던 변수들에 대해서 저장을 해야함 
leaf_example:
addi	$sp, $sp, -4		# $sp = $sp + -4
sw		$s0, 0($sp)		    # s0를 사용하기 위해서 저장을 함 
add		$t0, $s0, $s1		# $t0 = $s0 + $s1
add		$t1, $s2, $s3		# $t1 = $s2 + $s3
sub		$s0, $t0, $t1		# $s0 = $t0 - $t1
add		$v0, $s0, $zero		# $v0 = $s0 + $zero
lw		$s0, 0($sp)		# 
addi	$sp, $sp, 4			# $sp = $sp + 4
jr		$ra					# jump to $ra


# C_code:
#  n = $a0
# int fact (int n){
#     if (n<1) return 1;
#     else return (n * fact(n-1));
#     }
factorial:
addi	$sp, $sp, -8			# $sp = $sp + -8
sw		$a0, 0($sp)		# 
sw		$ra, 4($sp)		# 

slti    $t0, $a0, 1
beq		$t0, $zero, not0	# if $t0 == $zero then not0

addi	$v0, $zero, 1			# $v0 = $zero + 1
addi	$sp, $sp, 8			# $sp = $sp + 8
jr		$ra					# jump to $ra

not0:
addi	$a0, $a0, -1			# $a0 = $a0 + -1
jal		factorial				# jump to factorial and save position to $ra
# 해당 위치의 jal 명령어를 실행할때, ra 값은 이 다음 위치인 54번째 라인이당 
# 호출한 프로그램으로 되돌아 가는 부분 
lw		$a0, 0($sp)		# 
lw		$ra, 4($sp)		# 
addi	$sp, $sp, 8			# $sp = $sp + 8
mul	    $v0, $a0, $v0		
jr		$ra					# jump to $ra



C_code:
# x,y = a0, a1
# i = s0 
# -----------------------------
# void strcpy ( char x[], char y[]){
#     int i;
#     i = 0;
#     while ( (x[i]=y[i])!='\0')
#         i++;
#     }
strcpy:
addi	$sp, $sp, -4			# $sp = $sp + -4
sw		$s0, 0($sp)		# 
add		$s0, $zero, $zero		# $s0, = $zero + $zero
L1:
add		$t1, $s0, $a1		# $t1 = $s0 + $a1
lbu     $t2, 0($t1)    
add		$t3, $s0, $a0		# $t3 = $s0 + $a0
sb		$t2, 0($t3)		# 
beq		$t2, $zero, L2	# if $t2 == $zero then L2
addi	$s0, $s0, 1			# $s0 = $s0 + 1
j		L1				# jump to L1
L2: 
lw		$s0, 0($sp)		# 
addi	$sp, $sp, 4			# $sp = $sp + 4
jr		$ra					# jump to $ra


