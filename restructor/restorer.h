#include <stdio.h>
#include <string.h>
#include "three.h"
#include "stack.h"
int search(char , char *);
void three_push_left(Stack *s, Bthree *th, int c, char *pre);
Bthree *restore_three(char *, char *);
Bthree *totaly_pop(Stack *);
int search(char , char *);
int init(FILE *);