#ifndef LIST_T_H
#define LIST_T_H
#include "template_maker.h"
#define list_type CAT(linked_list, T)
typedef struct _list_node{
	T item;
	struct _list_node *next, *pre;
} list_node;

typedef struct _list{
	list_node *first, *last;
} list_type;
list_node *new_list_node();
list_type *CAT(new, list_type)();
int CAT(push_back, T)(list_type *, T);
int CAT(isEmpty, T)(list_type *);
int CAT(push_front, T)(list_type *, T);
#endif