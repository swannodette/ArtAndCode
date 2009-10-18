// clang -Wall -o structfun3.o structfun3.c

#include <stdio.h>
#include <stdlib.h> // defines malloc and free

// Define Vector 
typedef struct Vector
{
  float x;
  float y;
} Vector;

typedef Vector* VectorRef;

// Define LinkedVector
typedef struct LinkedVector
{
  Vector point;
  struct LinkedVector* next;
} LinkedVector;

typedef LinkedVector* LinkedVectorRef;

// function to create linked vectors
LinkedVectorRef CreateLinkedVector(float x, float y)
{
  LinkedVectorRef newLinkedVector = malloc(sizeof(LinkedVector));

  newLinkedVector->point.x = x;
  newLinkedVector->point.y = y;
  
  return newLinkedVector;
}

void DestroyLinkedVector(LinkedVectorRef v)
{
  v->next = NULL;
  free(v);
}

void LinkTheVectors(LinkedVectorRef a, LinkedVectorRef b)
{
  a->next = b;
}

int main(int argc, char**argv)
{
  printf("The size of an float is %ld bytes\n", sizeof(float));
  printf("The size of a Vector is %ld bytes\n", sizeof(Vector));
  printf("The size of a VectorRef is %ld bytes\n", sizeof(VectorRef));
  printf("The size of a LinkedVector is %ld bytes\n\n", sizeof(LinkedVector));
  
  // remember LinkedVector* and LinkedVectorRef are interchangeable
  // because we defined them that way above!
  LinkedVector* v1 = CreateLinkedVector(5.0f, 2.5f);
  LinkedVectorRef v2 = CreateLinkedVector(2.5f, 5.0f);
  
  // remember -> dereferences a pointer! ptr->field is the same as (*ptr).field!
  printf("We just created a linked vector! <%f, %f>\n", v1->point.x, v1->point.y);
  printf("We just created a second linked vector! <%f, %f>\n\n", (*v2).point.x, (*v2).point.y);
  
  // now lets link them
  LinkTheVectors(v1, v2);
  
  printf("v1 now points to v2, is this true? %d\n", (v1->next == v2));
  
  // reclaim memory
  DestroyLinkedVector(v1);
  DestroyLinkedVector(v2);

  return 0;
}