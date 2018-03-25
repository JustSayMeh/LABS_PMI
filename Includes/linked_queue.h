typedef struct _node Node;
typedef struct _node{
	char item;
	Node *next, *pre;
} Node;

typedef struct _linked_queue {
	Node *pointer;
} Queue;

int isEmpty(Queue *);
Queue *new_queue();
int enqueue(Queue *, char );
int dequeue(Queue *, char *);
void print_queue(Queue *);
void clear_queue(Queue *);
