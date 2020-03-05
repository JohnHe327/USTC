//
// Created by hechu on 2019/11/12.
//

#ifndef _INTERVALTREE_H
#define _INTERVALTREE_H

#include <stdlib.h>

typedef struct Interval{
    int low, high;
} Interval;// Interval >= 0

typedef struct IntervalNode{
    struct IntervalNode *parent, *right, *left;
    Interval key;
    int max;
} IntervalNode;
IntervalNode *nil;

IntervalNode *InitIntervalTree()
{
    nil = (IntervalNode *)malloc(sizeof(IntervalNode));
    nil->parent = nil->left = nil->right =NULL;
    nil->key.low = nil->key.high = -1;
    nil->max = -1;
    IntervalNode *root = nil;
    return root;
}

int overlap(Interval x, Interval y)
{
    return x.low <= y.high && x.high >= y.low;
}

IntervalNode *IntervalSearch(IntervalNode *root, Interval i)
{
    IntervalNode *x = root;
    while(x != nil && !overlap(x->key, i)){
        if(x->left != nil && x->left->max >= i.low)
            x = x->left;
        else
            x = x->right;
    }
    return x;
}

int maintainMax(IntervalNode *x)
{
    if(x == nil) return -1;
    int leftMax = maintainMax(x->left);
    int rightMax = maintainMax(x->right);
    int xMax = x->key.high;
    if(leftMax > xMax)
        xMax = leftMax;
    if(rightMax > xMax)
        xMax = rightMax;
    x->max = xMax;
    return xMax;
}

IntervalNode *TreeMinimum(IntervalNode *x)
{
    while(x->left != nil)
        x = x->left;
    return x;
}

IntervalNode *TreeMaximum(IntervalNode *x)
{
    while(x->right != nil)
        x = x->right;
    return x;
}

IntervalNode *TreeSuccessor(IntervalNode *x)
{
    if(x->right != nil)
        return TreeMinimum(x->right);
    IntervalNode *y = x->parent;
    while(y != nil && x == y->right){
        x = y;
        y = y->parent;
    }
    return y;
}

IntervalNode *TreePredecessor(IntervalNode *x)
{
    if(x->left != nil)
        return TreeMaximum(x->left);
    IntervalNode *y = x->parent;
    while(y != nil && x == y->left){
        x = y;
        y = y->parent;
    }
    return y;
}

void IntervalInsert(IntervalNode **root, IntervalNode *z)
{
    IntervalNode *x = *root, *y = nil;
    while(x != nil){
        y = x;
        if(z->key.low < x->key.low) {
            if(x->max < z->max)
                x->max = z->max;
            x = x->left;
        }
        else{
            if(x->max < z->max)
                x->max = z->max;
            x = x->right;
        }
    }
    z->parent = y;
    if(y == nil){
        *root = z;
    }
    else if(z->key.low < y->key.low)
        y->left = z;
    else
        y->right = z;
}

IntervalNode *IntervalDelete(IntervalNode **root, IntervalNode *z)
{
    IntervalNode *x, *y;
    if(z->left == nil || z->right == nil)
        y = z;
    else
        y = TreeSuccessor(z);

    if(y->left != nil)
        x = y->left;
    else
        x = y->right;

    if(x != nil)
        x->parent = y->parent;

    if(y->parent == nil)
        *root = x;
    else if(y == y->parent->left)
        y->parent->left = x;
    else
        y->parent->right = x;

    if(y != z)
        z->key = y->key;

    maintainMax(*root);
    return y;
}

IntervalNode *CreatNode(Interval key)
{
    if(key.low > key.high || key.low < 0 || key.high < 0)
        return NULL;
    IntervalNode *x = (IntervalNode *)malloc(sizeof(IntervalNode));
    x->parent = x->left = x->right = nil;
    x->key = key;
    x->max = key.high;
    return x;
}
#endif //_INTERVALTREE_H
