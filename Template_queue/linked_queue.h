#ifndef LINKED_QUEUE_H
#define LINKED_QUEUE_H
#include "template_maker.h"
#define STR_TYPE CAT(Queue, T)
typedef struct _node Node;
typedef struct _node{
	T item;
	Node *next, *pre;
} Node;

typedef struct _linked_queue {
	Node *pointer;
} STR_TYPE;

int CAT(isEmpty, T)(STR_TYPE *);
STR_TYPE *CAT(new_queue, T)();
int CAT(enqueue, T)(STR_TYPE *, T );
int CAT(dequeue, T)(STR_TYPE *, T *);
void CAT(print_queue, T)(STR_TYPE *);
void CAT(clear_queue, T)(STR_TYPE *);
#endif