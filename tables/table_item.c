#include "table_item.h"
#include <stdlib.h>

table_item *new_table_item()
{
	table_item *n = malloc(sizeof(table_item));
	if (n == NULL)
		return NULL;
	n->top = new_linked_list_int();
	return n;
}