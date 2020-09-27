# int find(int a[], int n, int x) {
# int i;
# for (i = 0; i != n; i++)
# if (a[i] == x)
# return i;
# return -1 

# a[], n , x = a0, a1, a2 
# a[i] = t0
# return value (i) = s0 

addi	$sp, $sp, -4		# $sp = $sp + -4
sw		$s0, 0($sp)		    # i를 사용하기 전 s0 value 저장 
add		$s0, $zero, $zero	# $s0 = $zero + $zero // i를 0으로 초기화
forLoop:
sll     $t0, $s0, 2         # i의 value를 indexing을 위해 주소단위로 변환 
add		$t0, $t0, $a0		# $t0 = $t0 + $a0 // converting된 i value와 a[]의 base address를 합침 = a[i]
lw		$t1, 0($t0)		    # a[i] 에서 value를 하나 받아옴 
beq		$a2, $t1, findTarget# if $a2 == $t1 then findTarget // a[i] == x, findTarget으로 이동 
addi	$s0, $s0, 1			# $s0 = $s0 + 1 // i++ 
bne		$a1, $s0, forLoop	# if $a1 != $s0 then forLoop // i != n 이 참인 경우 for-statement 지속 
# end of for-statement
addi	$v0, $zero, -1			# $v0 = $zero + -1 
# lw		$s0, 0($sp)		# 
# addi	$sp, $sp, 4			# $sp = $sp + 4
# jr		$ra					# jump to $ra
j		exitFind				# jump to exitFind
# (a[i]==x) return i;
findTarget:
add		$v0, $s0, $zero		# $v0 = $s0 + $zero // v0 에 찾은 i 값을 넓음 
exitFind:
lw		$s0, 0($sp)		    # 함수 실행 때, 저장했던 s0를 다시 받아옴 
addi	$sp, $sp, 4			# $sp = $sp + 4 // 스택 복원 
jr		$ra					# jump to $ra  // return i 




