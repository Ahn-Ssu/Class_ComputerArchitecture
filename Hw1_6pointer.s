int find(int *a, int n, int x){
  int *p;

  for(p=&a[0]; p!=&a[n] ; p = p+1){
    if(*p==x){
      return (p-&a[0])/4
    }
  }
  return -1; 
}

# a[], n , x = a0, a1, a2 
# a[i] = t0
# return value (i) = s0 

# *a, n, x = a0, a1, a2
# p = t0 
# retrun value = s0 

addi	$sp, $sp, -4		# $sp = $sp + -4
sw		$s0, 0($sp)		    # i를 사용하기 전 s0 value 저장 
# add		$s0, $zero, $zero	# $s0 = $zero + $zero // i를 0으로 초기화
add		$t0, $a0, $zero		# $t0 = $a0 + $zero // p = &a[0]
sll     $t1, $a1, 2         # t1 = a1 * 4 // n* 4 
add		$t2, $t0, $t1		# $t2 = $t0 + $t1 // a[n]

forLoop:
# sll     $t0, $s0, 2         # i의 value를 indexing을 위해 주소단위로 변환 
# add		$t0, $t0, $a0		# $t0 = $t0 + $a0 // converting된 i value와 a[]의 base address를 합침 = a[i]
lw		$t1, 0($t0)		    # p -> p* 
beq		$a2, $t1, findTarget# if $a2 == $t1 then findTarget // a[i] == x, findTarget으로 이동 
# addi	$t0, $s0, 1			# $s0 = $s0 + 1 // i++ 
addi	$t0, $t0, 4			# $t0 = $t0 + 4 // p = p + 1 (4)
bne		$t2, $t0, forLoop	# if $a1 != $s0 then forLoop // i != n 이 참인 경우 for-statement 지속 
# end of for-statement
addi	$v0, $zero, -1			# $v0 = $zero + -1 
# lw		$s0, 0($sp)		# 
# addi	$sp, $sp, 4			# $sp = $sp + 4
# jr		$ra					# jump to $ra
j		exitFind				# jump to exitFind
# (a[i]==x) return i;
findTarget:
sub		$s0, $t0, $a0		# $s0 = $t0 - $a0 // p - &a[0]
srl     $v0, $s0, 4         # p-&a[0] / 4 
# add		$v0, $s0, $zero		# $v0 = $s0 + $zero // v0 에 찾은 i 값을 넓음 
exitFind:
lw		$s0, 0($sp)		    # 함수 실행 때, 저장했던 s0를 다시 받아옴 
addi	$sp, $sp, 4			# $sp = $sp + 4 // 스택 복원 
jr		$ra					# jump to $ra  // return i 




