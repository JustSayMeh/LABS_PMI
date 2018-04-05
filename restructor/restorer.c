#include "restorer.h"
Bthree *restore_three(char *pre, char *in)
{
	Stack *s  = new_stack();
	Bthree *th = new_three(), *ret = NULL;
	th->elem = in[0];
	push(s, th);
	for (int i = 1; in[i] != '\0'; i++)
	{
		th = new_three();
		th->elem = in[i];
		int cp = search(in[i], pre);
		char lelem = s->top->item->elem;
		int lcp = search(lelem, pre);
		if (cp < lcp)
			three_push_left(s, th, cp, pre);
		else 
			push(s, th);
	}
	ret = totaly_pop(s);
	return ret;
}
int search(char j, char *s)
{
	int i = 0;
	int len = strlen(s);
	for(; i < len && s[i] != j; i++)
		;
	return i; 

}
int init(FILE *in)
{
	char pre[256] = {0}, inf[256] = {0};
	fscanf(in, "%s", pre);
	fscanf(in, "%s", inf);
	Bthree *t = restore_three(pre, inf);
}

void three_push_left(Stack *s, Bthree *th, int c, char *pre)
{
	Bthree *g = NULL, *acc = NULL;
	while(!is_stack_empty(s) && search(s->top->item->elem, pre) > c)
	{
		pop(s, &g);
		if (acc == NULL)
			acc = g;
		else 
		{
			g->right = acc;
			acc = g;
		} 
	}
	th->left = acc;
	push(s, th);
}

Bthree *totaly_pop(Stack *s)
{
	Bthree *g = NULL, *acc = NULL;
	while(!is_stack_empty(s))
	{
		pop(s, &g);
		if (acc == NULL)
			acc = g;
		else 
		{
			g->right = acc;
			acc = g;
		} 
	}
	return acc;
}