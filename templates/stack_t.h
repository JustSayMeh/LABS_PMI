#include "template_maker.h"
#define struct_name CAT(stack, T)
typedef struct _node{
  T item;
  struct _node *next; 
} Node;
typedef struct _stack{
	Node *top;
} struct_name;

int CAT(pop, T)(struct_name *, T *);
int CAT(push, T)(struct_name *, T);
struct_name *CAT(new_stack, T)();
int CAT(is_stack_empty, T)(struct_name *);