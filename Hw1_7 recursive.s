int findMax(int integerArray[], int N){
  int max, temp;

  if(N==1){
    return integerArray[0];
  } 
  else{
    temp = findMax(integerArray, N-1);
    max = integerArray[N-1]>temp?integerArray[N-1]:temp;
    printf("now largest number = %d\n",max);
    return max;
  }
}

findMax:
addi	$sp, $sp, -12			# $sp = $sp + -12
sw		$ra, 8($sp)		# 
sw		$a1, 4($sp)		# 
sw		$a0, 0($sp)		# 
slti  $t0, $a0, 2   # n < 2? -> n이 1일때 
beq		$t0, $zero, elseCase	# if $t0 == $zero then case1
#  n이 1 이하일때 
lw		$v0, 0($a0)		# 
addi	$sp, $sp, 12			# $sp = $sp + 12
jr		$ra					# jump to $ra
elseCase:
# else 문 
addi	$a1, $a1, -1			# $a1 = $a1 + -1
jal		findMax				# jump to findMax and save position to $ra
lw		$ra, 8($sp)		# 
lw		$a1, 4($sp)		# 
lw		$a0, 0($sp)		# 
sll   $t0, $a1, 2
add		$t1, $a0, $t0		# $t1 = $a0 + $t0
addi	$t1, $t1, -4			# $t1 = $t1 + -4
lw		$t2, 0($t1)		# 
slt   $t3, $v0, $t2  # v = 0 return된 findMax 값(temp), t2 array의 마지막 element  (temp<a[n-1])??
bne		$t3, $zero, setEndMax	# if $t3 != $zero then ???
j		  exitMax				# jump to exitMax
setEndMax:
add		$v0, $t1, $t2		# $v0 = $t1 + $t2
exitMax:
jr		$ra					# jump to $ra

