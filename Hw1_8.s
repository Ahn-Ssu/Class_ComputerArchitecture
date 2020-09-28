#include <stdio.h>

char *strcat(char *dest, const char *src) ;

int main() {
char str1[30] = "Handong Global ";
char str2[] = "University";
strcat(str1, str2);
printf("results: %s\n", str1);
return 0;
}

char *strcat(char *dest, const char *src) {
 char *pDest;
 char *pSrc;

pDest = dest;

while(*pDest !='\0'){
  pDest = pDest +1;
}

pSrc = src;

while(*pSrc !='\0'){
*pDest = *pSrc;

  pDest = pDest +1;
  pSrc = pSrc +1 ;
}

  return pDest;
}

# *dest, *src = a0, a1
# *pDest, *pSrc = t0, t1

strcat:
# add		$t2, $zero, $zero		# $t2 = $tzero+ $zero // i 처럼 이동시킬 변수 
add		$t0, $a0, $zero		# pDest 시작부터  // pDest = dest;
loop1:
lbu     $t3, 0($t0)         # *pDest
addi	$t0, $t0, 1			# $t0 = $t0 + 1 // byte ++ :  pDest = pDest +1;
bne		$t3, $zero, loop1	# if $t3 != $zero then loop1  // while(*pDest !='\0')
add		$t1, $a1, $zero		# pSrc 시작부터 // pSrc = src;
loop2:
lbu     $t3, 0($t1)         # *pSrc
sb		$t3, 0($t0)		    # *pDest = *pSrc; 
beq		$t3, $zero, exitStr # if $t3 == $zero then exitStr // *pSrc !='\0'
addi	$t0, $t0, 1			# $t0 = $t0 + 1 // pDest = pDest +1;
addi	$t1, $t1, 1			# $t0 = $t0 + 1 // pSrc = pSrc +1 ;
j		loop2				# jump to loop2 // 탈출 못해서 loop
exitStr:
add		$v0, $a0, $zero		# $v0 = $a0 + $zero
jr		$ra					# jump to $ra