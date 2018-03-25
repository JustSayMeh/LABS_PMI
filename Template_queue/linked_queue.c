#include <stdlib.h>
#include <stdio.h>
#include "../Includes/linked_queue.h" 
int CAT(isEmpty, T)(STR_TYPE *q)
{
	return q->pointer == NULL;
}

STR_TYPE *CAT(new_queue, T)()
{
	STR_TYPE *q = malloc(sizeof(STR_TYPE));
	q->pointer = NULL;
	return q;
}

int CAT(enqueue, T)(STR_TYPE *q, T i)
{
	Node *n = malloc(sizeof(Node));
	if (n == NULL)
		return 1;
	n->item = i;
	if (q->pointer == NULL)
		q->pointer = n->next = n->pre = n;
	else
	{
		n->next = q->pointer;
		n->pre = q->pointer->pre;
		q->pointer->pre->next = n;
		q->pointer->pre = n;

	}
}

int CAT(dequeue, T)(STR_TYPE *q, T *i)
{
	if (q->pointer == NULL)
		return 2;
	*i = q->pointer->item;
	Node *out = q->pointer;
	if (q->pointer->next == q->pointer)
		q->pointer = NULL;
	else
	{
		q->pointer = out->next;
		q->pointer->pre = out->pre;
		out->pre->next = q->pointer;
	}
	free(out);
	return 0;
}

void CAT(clear_queue, T)(STR_TYPE *q)
{
	if (CAT(isEmpty, T)(q))
		return;
	Node *th;
	q->pointer->pre->next = NULL;
	for (Node *c = q->pointer; c != NULL;)
	{
		th = c;
		c = c->next;
		free(th);
	}
	q->pointer = NULL;
}
