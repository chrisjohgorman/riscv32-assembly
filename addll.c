#include <stdio.h>
#include <stdlib.h>

typedef struct LL {
    int data;
    struct LL *next;
} LL;

extern LL *addll(LL *list, LL *element);

int main(void) {
    LL *list = NULL;

    // Create some elements
    LL *node1 = (LL *)malloc(sizeof(LL));
    node1->data = 10;
    node1->next = NULL;

    LL *node2 = (LL *)malloc(sizeof(LL));
    node2->data = 20;
    node2->next = NULL;

    // Add elements to the list
    list = addll(list, node1);
    list = addll(list, node2);

    // Print the list
    LL *current = list;
    while (current != NULL) {
        printf("%d -> ", current->data);
        current = current->next;
    }
    printf("NULL\n");

    return 0;
}
