#include <stdio.h>
#include "./linked_queue.h" 
void print_queue(Queue_int *);
int main()
{
	Queue_int *g = new_queue_int();
	enqueue_int(g, 3);
	print_queue(g);
	return 0;
}

void print_queue(Queue_int *q)
{
	if (isEmpty_int(q))
	{
		printf("Queue is empty\n");
		return;
	}
	Node *c = q->pointer;
	printf("%d ", c->item);
	for (c = c->next; c != q->pointer; c = c->next)
		printf("%d ", c->item);
}