#include "linked_queue.h"
#include "three.h"
#include <stdio.h>
#include <stdlib.h>
Bthree *cpy_three(Bthree *q)
{
	if (q == NULL)
		return NULL;
	Bthree *c = new_three();
	c->left = cpy_three(q->left);
	c->elem = q->elem;
	c->right = cpy_three(q->right);
	return c;
}
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
	switch (s)
	{
	case '(':
		d = new_three();
		scanf("%c", &s);
		d->elem = s;
		d->left = build_three();
		d->right = build_three();
		scanf("%c", &s);
		return d;
	case '0':
		return NULL;
	case ',':
		d = build_three();
		return d;
	}
}

Bthree *build_three_inf()
{
	char s;
	Bthree *d = new_three();
	scanf("%c", &s);
	switch (s)
	{
		case '(':
			d->left = build_three_inf();
			scanf("%c", &s);
			d->elem = s;
			d->right = build_three_inf();
			scanf("%c", &s);
			return d;
		default:
			d->elem = s;
			d->right = d->left = NULL;
			return d;
	}
}

int bypass_width(Bthree *r, char f, int *len)
{
	int l = 1, lev = 0, acc = 0, fl = -1;
	Queue *q = new_queue();
	enqueue(q, r);
	while (!isEmpty(q) && fl)
	{
		dequeue(q, &r);
		if (r->left != NULL)
		{
			acc += 1;
			enqueue(q, r->left);
		}
		if (r->right != NULL)
		{
			acc += 1;
			enqueue(q, r->right);
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

int restructer(Bthree *r)
{
	Bthree *cpy, *n;
	Queue *q = new_queue();
	enqueue(q, r);
	while (!isEmpty(q))
	{
		dequeue(q, &r);
		if (r->elem == '*' && (r->left->elem == '+' || r->left->elem == '-'))
		{
			cpy = cpy_three(r->right);
			n = new_three();
			n->elem = r->elem;
			r->elem = r->left->elem;
			r->left->elem = n ->elem;
			n->right = r->right;
			n->left = r->left->right;
			r->left->right = cpy;
			r->right = n;
		}
		else if (r->elem == '*' && (r->right->elem == '+' || r->right->elem == '-'))
		{
			cpy = cpy_three(r->left);
			n = new_three();
			n->elem = r->elem;
			r->elem = r->right->elem;
			r->right->elem = n->elem;
			n->left = r->left;
			n->right = r->right->left;
			r->right->left = cpy;
			r->left = n;
		}

		if (r->left != NULL)
			enqueue(q, r->left);
		if (r->right != NULL)
			enqueue(q, r->right);
	}
	return 0;
}