#ifndef TABLE_ITEM_H
#define TABLE_ITEM_H
#define T int
#include "../templates/list_t.h"
typedef struct _table_item{
	char key[16];
	list_type *top;
} table_item;
table_item *new_table_item();
#endif