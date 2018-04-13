#include <string.h>
#include <stdlib.h>
#include "table.h"
Table *new_table()
{
	Table *t = calloc(1 ,sizeof(Table));
	if (t == NULL)
		return NULL;
	t->size = 0;
	return t;
}
int b_search(Table *th, char *str, int *res)
{
	int start = 0, end = th->size, b, f = 0, mid = 0;
	table_item **m = th->skeys;
	while (start < end && !f)
	{
		mid = (start + end) / 2;
		b = strcmp(m[mid]->key, str);
		if (b > 0)
			end = mid;
		else if (b < 0)
			start = mid + 1;
		else
		{
			start = mid;
			f = 1;
		}
	}
	*res = start;
	return f;
}

int add_to_table(Table *th, char *str, int item)
{
	table_item *n;
	int index, founded;
	if (th->size == N)
		return 2;
	if (strlen(str) > 15)
		return 1;
	founded = b_search(th, str, &index);
	if (th->skeys[index] == NULL || !founded)
	{
		n = new_table_item();
		strcpy(n->key, str);
		push_back_int(n->top, item);
		memcpy(th->skeys + index + 1, th->skeys + index, 
				(th->size - index)*sizeof(table_item*));
		th->skeys[index] = n;
		th->size += 1;
	}
	else
		push_back_int(th->skeys[index]->top, item);
	return 0;
}


