# https://github.com/Ahn-Ssu/MIPSpractice.git


arithmaticExpressionEx:
# f = ( g + h ) - ( i + j ) ;
add      $t0, $s1, $s2      # $t0 = $s1 + $s2
add      $t1, $s3, $s4      # $t1 = $s3 + $s4
sub      $s0, $t0, $t1      # $s0 = $t0 - $t1

memoryAddressingEx:
# g = h + A[8]
lw      $t0, 32($s3)      # 
add      $s1, $s2, $t0      # $s1 = $s2 + $t0

loadWordnSaveWord:
# a[12] = h + a[8] 
# A = $s3, h = $s2
lw      $t1, 32($s3)      # 
add      $t0, $t1, $s2      # $t0 = $t1 + $s2
sw      $t0, 48($s3)      # 

beqNbneEx:
# if(i==j) f = g+h; else f = g - h 
# f,g,h,i,j = s0 - s4 

# branch equal 사용 
beq      $s3, $s4, true   # if $s3 == $s4 then true
sub      $s0, $s1, $s2      # $s0 = $s1 - $s2
j      Exit            # jump to Exit
true:
add      $s0, $s1, $s2      # $s0 = $s1 + $s2
Exit:   # 구현 생략 

# branch not equal 사용
bne      $s3, $s4, else   # if $s3 != $s4 then else
add      $s0, $s1, $s2      # $s0 = $s1 + $s2
j      Exit            # jump to Exit
else:
sub      $s0, $s1, $s2      # $s0 = $s1 - $s2
Exit:   # 구현 생략  


loopEx:
# while (save[i] == k) i += 1;
# i,k,save = s3,s5,s6 

# i) save[i]를 임시 레지스터로 가져오는 것, 먼저 그 주소를 구해야한다.
#   바이트 주소 문제 때문에 인덱스 i에 4를 곱해서 save의 시작 주소에 더해야 주소가 만들어진다.
sll     $t1 $s3 2           # 현재 i의 값에다가 워드 단위 메모리 주소 접근을 위해서 word size 를 곱함 ( i의 value를 조작하는 것이 아님)
add		$t1, $t1, $s6		# $t1 = $t1 + $s6 // save의 address에 t1의 value를 합치면 i번째 address가 됨 
lw		$t0, 0($t1)		    # from save[i] / 합을 통해 얻어낸 i번째 address에 첫번째(index = 0) 
#  해당 while문, ture이면 뺑뺑이  
bne		$t0, $s5, Exit	    # if $t0 != $s5 then Exit
# 탈출 못했으니까 i ++; 
addi	$s3, $s3, 1			# $s3 = $s3 + 1
j		loop				# jump to loop
Exit:   # 구현 생략 


# branch eqaul 을 사용하면??
sll     $t1, $s3, 2
add		$t1, $t1, $s6		# $t1 = $t1 + $s6
lw		$t0, 0($t1)		# 
addi	$s5, $s5, 1			# $s5 = $s5 + 1 // !!!!! 조건식을 먼저 체크해야하는데 내부를 먼저 실행함  
beq		$t0, $s5, loop 	# if $t0 == $s5 then loop
# 동일한 경우로 코드를 짜면 증가연산을 할 곳이 애매함...

# IndexOutOfBounds
sltu    $t0, $s1, $t2       #t0 = 0 if $s1 >= length or $s1 <0 
beq		$t0, $zero, IndexOutOfBounds	# if $t0 == $zero then IndexOutOfBounds
