#include <stdlib.h>
#include <stdio.h>
#include "linked_queue.h" 

int isEmpty(Queue *q)
{
	return q->pointer == NULL;
}

Queue *new_queue()
{
	Queue *q = malloc(sizeof(Queue));
	q->pointer = NULL;
	return q;
}

int enqueue(Queue *q, char i)
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

int dequeue(Queue *q, char *i)
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

void clear_queue(Queue *q)
{
	if (isEmpty(q))
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

void print_queue(Queue *q)
{
	if (isEmpty(q))
	{
		printf("Queue is empty\n");
		return;
	}
	Node *c = q->pointer;
	printf("%c ", c->item);
	for (c = c->next; c != q->pointer; c = c->next)
		printf("%c ", c->item);
}