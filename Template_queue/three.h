#ifndef THREE_H
#define THREE_H
typedef struct _bthree {
	char elem;
	struct _bthree *left, *right;
} Bthree;
typedef Bthree* bthreep;

Bthree *cpy_three(Bthree *);
Bthree *new_three();
Bthree *build_three();
Bthree *build_three_inf();
int bypass_width(Bthree *, char , int *);
int restructer(Bthree *);
#endif
