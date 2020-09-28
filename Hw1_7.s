int findMax(int integerArray[], int N){
  int max = integerArray[0];

  for(int i = 0; i < N; i++){
    if(max<integerArray[i]){
      max = integerArray[i];
    }
  }
  printf("the largest number = %d",max);

  return max;
}

integerArray[], N = a0, a1;
max = t4;

addi	$sp, $sp, -4			# $sp = $sp + -4
sw		$s0, 0($sp)		    # s0를 사용하기 위해서 s0 값 보존
lw		$t4, 0($s1)		    # max를 첫번째 element로 초기화 
add		$s0, $s0, $zero		# 사용할 i 값도 초기화 
forLoop:
sll   $t0, $s0, 2       # i 값을 size에 맞게 증가
add		$t0, $t0, $a0		  # i + a' base address = a[i]
lw		$t1, 0($t0)		    # a[i] 값 받아옴
slt   $t2, $t4, $t1     # max<a[i] ?? 
bne		$t2, $zero, changeMax	# if $t2 != $zero then changeMax // true 수행 조건 -> changeMax
addi	$s0, $s0, 1			  # i값을 증가 시킨후 for 조건문에 대한 테스트 
slt   $t2, $s0, $a1     # i < n ?? 
bne		$t2, $zero, forLoop	# 조건문이 참이면 forLoop를 1회 더 
j		exitMax				# jump to exitMax
changeMax:
add		$t4, $t1, $zero		# $t4 = $t1 + $zero
addi	$s0, $s0, 1			# $s0 = $s0 + 1
j		forLoop				# jump to forLoop
exitMax:
add		$v0, $t4, $zero		# $v0 = $t4 + $zero // 최댓값 max를 v0 로
lw		$s0, 0($sp)		# 
addi	$sp, $sp, 4			# $sp = $sp + 4
jr		$ra					# jump to $ra
