# #include <stdio.h>

# char *strcat(char *dest, const char *src) ;

# int main() {
# char str1[30] = "Handong Global ";
# char str2[] = "University";
# strcat(str1, str2);
# printf("results: %s\n", str1);
# return 0;
# }

# char *strcat(char *dest, const char *src) {
#  char *pDest;
#  char *pSrc;

# pDest = dest;

# while(*pDest !='\0'){
#   pDest = pDest +1;
# }

# pSrc = src;

# while(*pSrc !='\0'){
# *pDest = *pSrc;

#   pDest = pDest +1;
#   pSrc = pSrc +1 ;
# }

#   return pDest;
# }

.data
str1: 
    .asciiz "Handong Global  " 
str2: 
    .asciiz "abcdefg"
result: 
    .space 200
newline: 
    .asciiz "\n"

.text
main:
la		$a0, str1
la    $a1, str2
la		$a2,result	# 



# li		$v0, 4		# $v0 = 4
# la		$a0, result 		# 
# syscall

jal		strcat				# jump to strcat and save position to $ra


li		$v0, 4		  
la		$a0, result		# 

# la  $a0,  str2
syscall

li		$v0, 10		
syscall

.end

strcat:
# add		$t2, $zero, $zero		# $t2 = $tzero+ $zero // i 처럼 이동시킬 변수 
addi	$sp, $sp, -8			# $sp = $sp + -8
sw		$s0, 0($sp)		# 
sw		$s1, 0($sp)		# 
add		$s0, $zero, $zero		# $0 = $zero + $zero
add		$s1, $zero, $zero		# $s1 = $zero + $zero
loop1:
add		$t4, $a2, $s0		# $t4 = $a3 + $s0
add		$t0, $a0, $s0		# pDest 시작부터  // pDest = dest;
lbu   $t3, 0($t0)         # *pDest
sb		$t3, 0($t4)
addi	$s0, $s0, 1			# $t0 = $t0 + 1 // byte ++ :  pDest = pDest +1;
bne		$t3, $zero, loop1	# if $t3 != $zero then loop1  // while(*pDest !='\0')
add		$s1, $zero, $zero		# $s1 = $zero + $zero
addi	$s0, $s0, -1			# $s0 = $s0 + -1

loop2:
add		$t4, $a2, $s0		# pDest 시작부터  // pDest = dest;
add		$t1, $a1, $s1		# pSrc 시작부터 // pSrc = src;
lbu   $t3, 0($t1)         # *pSrc
sb		$t3, 0($t4)		    # *pDest = *pSrc; 
beq		$t3, $zero, exitStr # if $t3 == $zero then exitStr // *pSrc !='\0'
addi	$s0, $s0, 1			# $t0 = $t0 + 1 // pDest = pDest +1;
addi	$s1, $s1, 1			# $t0 = $t0 + 1 // pSrc = pSrc +1 ;
j		loop2				# jump to loop2 // 탈출 못해서 loop
exitStr:
add		$v1, $a2, $zero		# $v0 = $a0 + $zero
jr		$ra					# jump to $ra