// gcc -Wall -o structfun1 structfun1.c

#include <stdio.h>

struct Vector
{
  float x;
  float y;
};

// alias struct Vector to allow just using Vector
typedef struct Vector Vector;

/*
  The above is equivalent to
  
  typedef struct Vector
  {
    float x;
    float y;
  } Vector;
*/

int main(int argc, char**argv)
{
  struct Vector v1 = { 5.0f, 2.5f };
  Vector v2 = { 9.0f, 3.14f };
  
  printf("<%f, %f>\n", v1.x, v1.y);
  printf("<%f, %f>\n", v2.x, v2.y);
  
  return 0;
}