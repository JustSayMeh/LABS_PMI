#include "stack.h"
#include <stdlib.h>

int pop(Stack *s, Bthree **i)
{
	if (s->top == NULL)
		return 1;
	*i = s->top->item;
	Node *rem = s->top;
	s->top = s->top->next;
	free(rem);
	return 0;
}
int push(Stack *s, Bthree *i)
{
	Node *nw = malloc(sizeof(Node));
	if (nw == NULL)
		return 2;
	nw->item = i;
	nw->next = s->top;
	s->top = nw;
	return 0;
}
Stack *new_stack()
{
	Stack *s = malloc(sizeof(Stack));
	s->top = NULL;
	return s;
}
int is_stack_empty(Stack *s)
{
	return (s->top == NULL);
}