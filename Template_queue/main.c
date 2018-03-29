#include <stdio.h>
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
	Bthree *d = build_three_inf(), *j;
	restructer(d);
	pre_order_print(d);
	printf("\n");
	in_order_print(d);
	printf("\n");
	post_order_print(d);
	printf("\n");
	return 0;
}