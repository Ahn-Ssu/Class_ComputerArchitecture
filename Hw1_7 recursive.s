# int findMax(int integerArray[], int N){
#   int max, temp;

#   if(N==1){
#     return integerArray[0];
#   } 
#   else{
#     temp = findMax(integerArray, N-1);
#     max = integerArray[N-1]>temp?integerArray[N-1]:temp;
#     return max;
#   }
# }
.data
array1:
    .word 1, 3, 5, 7, 9, 8, 6, 4, 2
N:  
    .word 9
newline: 
    .asciiz "\n"

.text
main:
la		$a0, array1
la    $t0,  N
lw    $a1,  0($t0)

jal		findMax				# jump to findMax and save position to $ra


li		$v0, 1		# $v0 = 1   
add		$a0, $v1, $zero		# $a0 = $s0 + $zero
syscall

li		$v0, 10		# $v0 = 1
syscall

.end


findMax:
addi	$sp, $sp, -8			# $sp = $sp + -8
sw		$ra, 4($sp)		# 
sw		$a1, 0($sp)		# 
# slti  $t0, $a0, 2   # n < 2? -> n이 1일때 
# beq		$t0, $zero, elseCase	# if $t0 == $zero then case1
bne		$a1, $zero, elseCase	# if $a0 == $zero then elseCase
#  n이 1 이하일때 
lw		$v1, 0($a0)		# integerArray[0]
addi	$sp, $sp, 8	# $sp = $sp + 12 //  스택 복원 
jr		$ra					  # jump to $ra
elseCase:
addi	$a1, $a1, -1	# $a1 = $a1 + -1 // N-1
jal		findMax				# jump to findMax and save position to $ra
lw		$ra, 4($sp)		# 
lw		$a1, 0($sp)		# 
addi	$sp, $sp, 8			# $sp = $sp + 8
sll     $t0, $a1, 2   # n-1 번째 index에 접근하기 위한 연산 
add		$t1, $a0, $t0	# $t1 = $a0 + $t0
addi	$t1, $t1, -4	# $t1 = $t1 + -4 // n-1 완성 
lw		$t2, 0($t1)		# integerArray[N-1]
slt     $t3, $v1, $t2 # v = 0 return된 findMax 값(temp), t2 array의 마지막 element  (temp<a[n-1])??
bne		$t3, $zero, setEndMax	# if $t3 != $zero then ???
j		exitMax				# jump to exitMax
setEndMax:
add		$v1, $zero, $t2		# $v1 = $t1 + $t2
exitMax:
jr		$ra					# jump to $ra

