#include <stdio.h>
#define T int
#include "list_t.h"
int main()
{
	int k;
	linked_list_int *j = new_linked_list_int();
	push_back_int(j, 4);
	push_back_int(j, 5);
	push_back_int(j, 6);
	return 0;
}