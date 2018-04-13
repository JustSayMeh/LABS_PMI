#include <stdio.h>
#include "stack.h"
#include "three.h"
void in_order_print(Bthree *q)
{
	if (q == NULL)
		return;
	in_order_print(q->left);
	printf(" %c ", q->elem);
	in_order_print(q->right);
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
	Bthree *f = build_three();
	//init(argv[1], &f);
	pre_order_print(f);
	printf("\n");
	post_order_print(f);
	printf("\n");
	in_order_print(f);
	printf("\n");
	return 0;
}