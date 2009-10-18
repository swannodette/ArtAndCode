// gcc -Wall -o pointerfun2 pointerfun2.c

#include <stdio.h>

int main(int argc, char** argv)
{
  char* myString = "Hello";
  char* currentChar = myString; // store the address in another char pointer
  
  printf("The char type represents a block of memory\n");
  printf("that is %ld bytes in size\n\n", sizeof(char));
  
  printf("The address currentChar points at is %p\n", currentChar);
  printf("it's value is %c\n", *currentChar);
  currentChar++;

  printf("The address start points at now is %p\n", currentChar);
  printf("it's value is %c\n", *currentChar);
  currentChar++;

  printf("The address currentChar points at now is %p\n", currentChar);
  printf("it's value is %c\n", *currentChar);
  currentChar++;

  printf("The address currentChar points at now is %p\n", currentChar);
  printf("it's value is %c\n", *currentChar);
  currentChar++;

  printf("The address currentChar points at now is %p\n", currentChar);
  printf("it's value is %c\n\n", *currentChar);
  currentChar++;
  
  printf("myString is just an array of chars\n");
  printf("it points to %p\n", myString);
  printf("it's value is %s\n", myString);

  return 0;
}