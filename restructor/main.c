#include <stdio.h>
#include "stack.h"
#include "three.h"
void in_order_print(Bthree *q)
{
	if (q == NULL)
		return;
	if (q->left == NULL)
	{
		printf(" %c ", q->elem);
		return;
	}
	printf("(");
	in_order_print(q->left);
	printf(" %c ", q->elem);
	in_order_print(q->right);
	printf(")");
}

void pre_order_print(Bthree *q)
{
	if (q == NULL)
		return;
	printf(" %c ", q->elem);
	pre_order_print(q->left);
	pre_order_print(q->right);
}

void post_order_print(Bthree *q)
{
	if (q == NULL)
		return;
	post_order_print(q->left);
	post_order_print(q->right);
	printf(" %c ", q->elem);
}
int main(int argc, char *argv[])
{
	char *in = "abdcegfhj";
	char *ou = "dbaegchfj";
	Bthree *j = NULL;
	j = restore_three(in, ou);
	in_order_print(j);
	return 0;
}