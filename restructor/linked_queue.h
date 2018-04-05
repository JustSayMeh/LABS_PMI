#include "three.h"
typedef struct _node Node;
typedef struct _node{
	Bthree *item;
	Node *next, *pre;
} Node;

typedef struct _linked_queue {
	Node *pointer;
} Queue;

int isEmpty(Queue *);
Queue *new_queue();
int enqueue(Queue *, Bthree *);
int dequeue(Queue *, Bthree **);
void print_queue(Queue *);
void clear_queue(Queue *);