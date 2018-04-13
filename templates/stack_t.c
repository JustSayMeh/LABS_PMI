#include "stack_t.h"
#include <stdlib.h>

int CAT(pop, T)(struct_name *s, T *i)
{
	if (s->top == NULL)
		return 1;
	*i = s->top->item;
	Node *rem = s->top;
	s->top = s->top->next;
	free(rem);
	return 0;
}
int CAT(push, T)(struct_name *s, T i)
{
	Node *nw = malloc(sizeof(Node));
	if (nw == NULL)
		return 2;
	nw->item = i;
	nw->next = s->top;
	s->top = nw;
	return 0;
}
struct_name *CAT(new_stack, T)()
{
	struct_name *s = malloc(sizeof(struct_name));
	s->top = NULL;
	return s;
}
int CAT(is_stack_empty, T)(struct_name *s)
{
	return (s->top == NULL);
}