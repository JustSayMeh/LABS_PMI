#ifndef STACK_H
#define STACK_H
#include "three.h"
typedef struct _node{
  Bthree *item;
  struct _node *next; 
} Node;
typedef struct _stack{
	Node *top;
} Stack;

int pop(Stack *, Bthree **);
int push(Stack *, Bthree *);
Stack *new_stack();
int is_stack_empty(Stack *);
#endif