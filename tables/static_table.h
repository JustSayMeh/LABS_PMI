#ifndef TABLE_H
#define TABLE_H
#ifndef N
#define N 100
#endif
typedef struct _table_item{
	char key[16];
	double elem;
} table_item;
typedef struct {
	table_item items[N];
	unsigned int size; 
}
Table;
int b_search(Table *, char *);
int add_to_table(Table *, table_item);
#endif

