int findMax(int integerArray[], int N){
  int max, temp;

  if(N==1){
    return integerArray[0];
  } 
  else{
    max = integerArray[0];
    temp = findMax(integerArray, N-1);
    max = integerArray[N-1]>temp?integerArray[N-1]:temp;
    printf("now largest number = %d\n",max);
    return max;
  }
}