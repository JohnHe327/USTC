//
// Created by hechu on 2019/12/20.
//

#ifndef _FIBONACCIHEAP_H
#define _FIBONACCIHEAP_H

#include <stdlib.h>

typedef struct Edge {
    int v, weight;
    struct Edge *nextEdge;
}edge;

typedef struct Vertex {
    int number;
    int distance;
    edge *nextEdge;
}vertex;

typedef struct FibNode {
    vertex vertex;
    int mark, degree;
    struct FibNode *leftSib, *rightSib;
    struct FibNode *child, *parent;
}fibNode;
fibNode *min;

int N;

void consolidateFibHeap()
{
    fibNode *degreeRecord[N + 10];
    int i;
    for (i = 0; i <= N; i++)
        degreeRecord[i] = NULL;
    if (min == NULL)
        return;
    degreeRecord[min->degree] = min;

    fibNode *current = min->rightSib;
    while (current != min) {
        while (degreeRecord[current->degree] != NULL) {
            fibNode *p = degreeRecord[current->degree];
            if (p == current)
                break;
            degreeRecord[current->degree] = NULL;

            if (p->vertex.distance < current->vertex.distance) {
                current->rightSib->leftSib = current->leftSib;
                current->leftSib->rightSib = current->rightSib;

                if (p->child != NULL) {
                    p->child->rightSib->leftSib = current;
                    current->rightSib = p->child->rightSib;
                    p->child->rightSib = current;
                    current->leftSib = p->child;
                } else {
                    p->child = current;
                    current->rightSib = current;
                    current->leftSib = current;
                }

                current->parent = p;
                p->degree++;

                if (current == min)
                    min = p;
                current = p;
            } else {
                p->rightSib->leftSib = p->leftSib;
                p->leftSib->rightSib = p->rightSib;

                if (current->child != NULL) {
                    current->child->rightSib->leftSib = p;
                    p->rightSib = current->child->rightSib;
                    current->child->rightSib = p;
                    p->leftSib = current->child;
                } else {
                    current->child = p;
                    p->rightSib = p;
                    p->leftSib = p;
                }

                p->parent = current;
                current->degree++;
                if (p == min)
                    min = current;
            }
        }
        degreeRecord[current->degree] = current;
        current = current->rightSib;
    }
}

fibNode *extractMIN()
{
    fibNode *p = min;
    if (p == NULL)
        return p;
    else if (p->rightSib == p) {
        min = p->child;
        if (min != NULL) {
            min->parent = NULL;
            fibNode *current = min->rightSib;
            while (current != p->child) {
                current->parent = NULL;
                if (current->vertex.distance < min->vertex.distance)
                    min = current;
                current = current->rightSib;
            }
        }
    } else if (p->child == NULL) {
        p->rightSib->leftSib = p->leftSib;
        p->leftSib->rightSib = p->rightSib;
        min = p->rightSib;
        fibNode *current = min->rightSib;
        while (current != p->rightSib) {
            if (current->vertex.distance < min->vertex.distance)
                min = current;
            current = current->rightSib;
        }
    } else {
        p->leftSib->rightSib = p->child;
        p->rightSib->leftSib = p->child->leftSib;
        p->child->leftSib->rightSib = p->rightSib;
        p->child->leftSib = p->leftSib;
        min = p->child;
        min->parent = NULL;
        fibNode *current = min->rightSib;
        while (current != p->child) {
            current->parent = NULL;
            if (current->vertex.distance < min->vertex.distance)
                min = current;
            current = current->rightSib;
        }
    }
    consolidateFibHeap();
    return p;
}

void CuttoRoot(fibNode *p)
{
    fibNode *q = p->parent;
    p->mark = 0;
    if (q == NULL)
        return;
    else if (q->degree == 1) {
        p->rightSib = min->rightSib;
        p->leftSib = min;
        min->rightSib->leftSib = p;
        min->rightSib = p;

        p->parent = NULL;
        if (min->vertex.distance > p->vertex.distance)
            min = p;

        q->child = NULL;
        q->degree--;
        if (q->mark == 0)
            q->mark = 1;
        else
            CuttoRoot(q);
    } else {
        if (q->child == p)
            q->child = p->rightSib;
        p->rightSib->leftSib = p->leftSib;
        p->leftSib->rightSib = p->rightSib;

        p->rightSib = min->rightSib;
        p->leftSib = min;
        min->rightSib->leftSib = p;
        min->rightSib = p;

        p->parent = NULL;
        if (min->vertex.distance > p->vertex.distance)
            min = p;

        q->degree--;
        if (q->mark == 0)
            q->mark = 1;
        else
            CuttoRoot(q);
    }
}

void decreaseKey(fibNode *p, int D)
{
    p->vertex.distance = D;
    if (p->parent == NULL){
        if (p->vertex.distance < min->vertex.distance)
            min = p;
    } else if (p->vertex.distance >= p->parent->vertex.distance)
        return;
    else
        CuttoRoot(p);
}

#endif //_FIBONACCIHEAP_H
