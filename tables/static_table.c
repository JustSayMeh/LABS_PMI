#include "static_table.h"
#include <string.h>
#include <stdlib.h>
#include "table.h"
int b_search(Table *th, char *str)
{
	unsigned int start = 0, end = th->size, b, mid = 0;
	while (start < end)
	{
		mid = (start - end) / 2 + start;
		b = strcmp(th->items[mid].key, str);
		if (b > 0)
			end = mid;
		else
			start = mid + 1;
	}
	return start;
}

// int add_to_table(Table *th, table_item elem)
// {
// 	int index;
// 	if (th->size == N)
// 		return 2;
// 	index = b_search(th, elem.key);
// 	memcpy(th->items + index + 1, th->items + index, sizeof(table_item)*(th->size - index));
// 	th->items[index].elem = elem.elem;
// 	strcpy(th->items[index].key, elem.key);
// 	th->size += 1;
// 	return 0;
// }


int add_to_table(Table *th, table_item elem)
{
	int i;
	if (th->size == N)
		return 2;
	for (i = th->size - 1; i >= 0 && strcmp(th->items[i].key, elem.key) > 0; i--)
		th->items[i + 1] = th->items[i];
	th->items[i + 1] = elem;
	th->size += 1;
	return 0;
}
