#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "static_table.h"
int main()
{
	Table th;
	printf("%d\n", th.size);
	memset(th.items, 0, sizeof(Table));
	table_item i;
	i.elem = 4;
	strcpy(i.key, "abc");
	add_to_table(&th, i);
	i.elem = 5;
	strcpy(i.key, "aac");
	add_to_table(&th, i);
	i.elem = 657;
	strcpy(i.key, "cbc");
	add_to_table(&th, i);
	return 0;
}