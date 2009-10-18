// gcc -Wall -o structfun2 structfun2.c

#include <stdio.h>

// Define Vector 
typedef struct Vector
{
  float x;
  float y;
} Vector;

// this only hold here becaues C is pass by value
void change(Vector a)
{
  a.x = a.x + 3.3f;
  printf("Here a.x is %f\n", a.x);
  return;
}

// you can pass structs by value
Vector add(Vector a, Vector b)
{
  Vector result = { a.x+b.x, a.y+b.y };
  return result;
}

int main(int argc, char**argv)
{
  Vector a = { 5.0f, 2.5f };
  Vector b = { 3.0f, 1.2f };

  change(a);
  printf("a.x in main is %f\n", a.x);

  // we pass structs by value, efficient
  Vector c = add(a, b);
  printf("c is <%f, %f>\n", c.x, c.y);
  
  return 0;
}