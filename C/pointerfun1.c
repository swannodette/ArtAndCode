// clang -Wall -o pointerfun1.o pointerfun1.c

#include <stdio.h>

// take the address of an integer holding block of memory
void checkPointer(int* intAddress)
{
  printf("The address is %p the value is %d\n", intAddress, *intAddress);
}

int main(int argc, char**argv)
{
  int x = 5;
  
  // print the hexadecimal address
  printf("%p\n", &x);
  
  // send the address of the memory block holding the integer value 5
  checkPointer(&x);
  
  return 0;
}