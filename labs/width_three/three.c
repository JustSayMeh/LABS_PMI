#include <stdlib.h>
#include <stdio.h>


typedef struct _bthree{
	char elem;
	struct _bthree *left, *right;
} Bthree;
typedef Bthree* bthreep;
#define T bthreep 
#include "polyqueue.h" 
Bthree *new_three()
{
	Bthree *q = malloc(sizeof(Bthree));
	q->left = NULL;
	q->right = NULL;
	return q;
}

Bthree *build_three()
{
	char s;
	Bthree *d;
	scanf("%c", &s);
	switch(s)
	{
		case '(' :
			d = new_three();
			scanf("%c", &s);
			d->elem = s;
			d->left = build_three();
			d->right = build_three();
			scanf("%c", &s);
			return d;
		case '0' :
			return NULL;
		case ',' :
			d = build_three();
			return d;
	}
}
int bypass_width(Bthree *r,  char f, int *len)
{
	int l = 1, lev = 0, acc = 0, fl = -1;
	Queue_bthreep *q = new_queue_bthreep(256);
	enqueue_bthreep(q, r);
	while (!isEmpty_bthreep(q) && fl)
	{
		dequeue_bthreep(q, &r);
		if (r->left != NULL)
		{
			acc += 1;
			enqueue_bthreep(q, r->left);
		}
		if (r->right != NULL)
		{
			acc += 1;
			enqueue_bthreep(q, r->right);
		}
		if (r->elem == f)
		{
			*len = lev;
			fl = 0;
		}
		l -= 1;
		if (l == 0)
		{	
			l = acc;
			acc = 0;
			lev += 1;
		}
	}
	return fl;
}

int main(int argc, char *argv[])
{
	int r;
	char h = argv[1][0];
	Bthree *d = build_three(), *j;
	int w = bypass_width(d, h, &r);
	printf("%d %d",w, r );
	return 0;
}

