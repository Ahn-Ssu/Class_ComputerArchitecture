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





C_code:
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
beq		$t0, $zero, not1	# if $t0 == $zero then not1

addi	$v0, $zero, 1			# $v0 = $zero + 1
addi	$sp, $sp, 8			# $sp = $sp + 8
jr		$ra					# jump to $ra

not1:
addi	$a0, $a0, -1			# $a0 = $a0 + -1
jal		factorial				# jump to factorial and save position to $ra


