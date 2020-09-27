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
max = s0;

