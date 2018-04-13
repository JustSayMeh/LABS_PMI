#include "restorer.h"
#ifdef POST
#define prior 1000
#define oper <
#elif PRE
#define prior -1
#define oper >
#endif
Bthree *look_top(Stack *);
void restore_three(char *pre, char *in, Bthree **p)
{
	Stack *s  = new_stack();
	Bthree *th = new_three(), *ret = NULL, *lk = NULL;
	th->elem = in[0];
	push(s, th);
	for (int i = 1; in[i] != '\0'; i++)
	{
		th = new_three();
		th->elem = in[i];
		int cp = search(in[i], pre);
		lk = look_top(s);
		char lelem = lk->elem;
		th->left = compaction(s, cp, pre);
		push(s, th);
	}
	*p =  compaction(s, prior, pre);
}
int search(char j, char *s)
{
	int i = 0;
	int len = strlen(s);
	for(; i < len && s[i] != j; i++)
		;
	return i; 

}
Bthree *look_top(Stack *s)
{
	return s->top->item;
}

void init(char *in, Bthree **d)
{
	Bthree *th = new_three();
	FILE *file = fopen(in, "r");
	char pre[256], inf[256];
	fscanf(file," %s%s", pre, inf);
	restore_three(pre, inf, d);
}

Bthree *compaction(Stack *s, int c, char *pre)
{
	Bthree *g = NULL, *acc = NULL, *step = NULL;
	while(!is_stack_empty(s) && (step = look_top(s)) && search(step->elem, pre) oper c)
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