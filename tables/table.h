#ifndef TABLE_H
#define TABLE_H
#ifndef N
#define N 100
#endif
#include "table_item.h"
typedef struct _table{
	table_item *skeys[N];
	int size;
} Table;
Table *new_table();
int b_search(Table *, char *, int *);
int add_to_table(Table *th, char *str, int item);
#endif