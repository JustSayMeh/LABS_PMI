#include <stdlib.h>
#include "list_t.h"
list_node *new_list_node()
{
	list_node *n = malloc(sizeof(list_node));
	if (n == NULL)
		return NULL;
	n->next = n->pre = NULL;
	return n;	
}
list_type *CAT(new, list_type)()
{
	list_type *n = malloc(sizeof(list_type));
	if (n == NULL)
		return NULL;
	n->first = n->last = NULL;
	return n;	
}
int CAT(push_back, T)(list_type *th, T i)
{
	list_node *n = new_list_node();
	if (th->first == NULL)
		th->last = th->first = n;
	else 
	{
		n->pre = th->last;
		th->last->next = n;
		th->last = n;
	}
	th->last->item = i;
	return 0;
}

int CAT(isEmpty, T)(list_type *th)
{
	return th->first == NULL;
}

int CAT(push_front, T)(list_type *th, T i)
{
	list_node *n = new_list_node();
	if (th->first == NULL)
		th->last = th->first = n;
	else 
	{
		n->next = th->first;
		th->first->pre = n;
		th->first = n;
	}
	th->first->item = i;
	return 0;
}