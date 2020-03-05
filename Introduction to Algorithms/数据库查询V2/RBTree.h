//
// Created by JohnHe on 2019/11/11.
//

#ifndef _RBTREE_H
#define _RBTREE_H

#include <stdlib.h>

typedef struct RBNode{
    struct RBNode *parent, *left, *right;
    int color;
    int key;
    int size;
}RBNode;
#define RED 0
#define BLACK 1
RBNode *nil;

RBNode *InitRBTree()
{
    nil = (RBNode *)malloc(sizeof(RBNode));
    nil->parent = nil->left = nil->right =NULL;
    nil->color = BLACK;
    nil->key = -1;
    nil->size = 0;
    RBNode *root = nil;
    return root;
}

void Print(RBNode *x)
{
    printf("key = %3d, color = %s, size = %2d, ", x->key, x->color?"BLACK":"RED  ", x->size);
    printf("parent = %3d, left = %3d, right = %3d\n",x->parent->key,x->left->key,x->right->key);
}

void InOrderTreeWalk(RBNode *x)
{
    if(x != nil){
        InOrderTreeWalk(x->left);
        Print(x);
        InOrderTreeWalk(x->right);
    }
}

void PreOrderTreeWalk(RBNode *x)
{
    if(x != nil){
        Print(x);
        PreOrderTreeWalk(x->left);
        PreOrderTreeWalk(x->right);
    }
}

void PostOrderTreeWalk(RBNode *x)
{
    if(x != nil){
        PostOrderTreeWalk(x->left);
        Print(x);
        PostOrderTreeWalk(x->right);
    }
}

RBNode *RBTreeSearch(RBNode *x, int key)
{
    while(x != nil && x->key != key){
        if(x->key > key)
            x = x->left;
        else
            x = x->right;
    }
    return x;
}

RBNode *RBTreeMinimum(RBNode *x)
{
    while(x->left != nil)
        x = x->left;
    return x;
}

RBNode *RBTreeMaximum(RBNode *x)
{
    while(x->right != nil)
        x = x->right;
    return x;
}

RBNode *RBTreeSuccessor(RBNode *x)
{
    if(x->right != nil)
        return RBTreeMinimum(x->right);
    RBNode *y = x->parent;
    while(y != nil && x == y->right){
        x = y;
        y = y->parent;
    }
    return y;
}

RBNode *RBTreePredecessor(RBNode *x)
{
    if(x->left != nil)
        return RBTreeMaximum(x->left);
    RBNode *y = x->parent;
    while(y != nil && x == y->left){
        x = y;
        y = y->parent;
    }
    return y;
}

void leftRotate(RBNode **root, RBNode *x)
{
    RBNode *y = x->right;
    y->parent = x->parent;
    if(x->parent != nil){
        if(x == x->parent->left)
            x->parent->left = y;
        else
            x->parent->right = y;
    }
    x->right = y->left;
    y->left->parent = x;
    y->left = x;
    x->parent = y;
    x->size = x->left->size + x->right->size + 1;
    y->size = y->left->size + y->right->size + 1;
    while((*root)->parent != nil)
        *root = (*root)->parent;
}

void rightRotate(RBNode **root, RBNode *x)
{
    RBNode *y = x->left;
    y->parent = x->parent;
    if(x->parent != nil){
        if(x == x->parent->left)
            x->parent->left = y;
        else
            x->parent->right = y;
    }
    x->left = y->right;
    y->right->parent = x;
    y->right = x;
    x->parent = y;
    x->size = x->left->size + x->right->size + 1;
    y->size = y->left->size + y->right->size + 1;
    while((*root)->parent != nil)
        *root = (*root)->parent;
}

void RBTreeInsert(RBNode **root, RBNode *z)
{
    RBNode *x = *root, *y = nil;
    while(x != nil){
        y = x;
        if(z->key < x->key) {
            x->size++;
            x = x->left;
        }
        else{
            x->size++;
            x = x->right;
        }
    }
    z->parent = y;
    if(y == nil){
        *root = z;
        z->color = BLACK;
    }
    else if(z->key < y->key)
        y->left = z;
    else
        y->right = z;

    while(z != *root && z->parent->color == RED){
        if(z->parent == z->parent->parent->left){
            y = z->parent->parent->right;
            if(y->color == RED){
                z->parent->color = BLACK;
                y->color = BLACK;
                z->parent->parent->color = RED;
                z = z->parent->parent;
            } else{
                if(z == z->parent->right){
                    z = z->parent;
                    leftRotate(root,z);
                }
                z->parent->color = BLACK;
                z->parent->parent->color = RED;
                rightRotate(root,z->parent->parent);
            }
        }
        else{
            y = z->parent->parent->left;
            if(y->color == RED){
                z->parent->color = BLACK;
                y->color = BLACK;
                z->parent->parent->color = RED;
                z = z->parent->parent;
            } else{
                if(z == z->parent->left){
                    z = z->parent;
                    rightRotate(root,z);
                }
                z->parent->color = BLACK;
                z->parent->parent->color = RED;
                leftRotate(root,z->parent->parent);
            }
        }
    }
    (*root)->color = BLACK;
}

RBNode *RBTreeDelete(RBNode **root, RBNode *z)
{
    RBNode *x, *y;
    if(z->left == nil || z->right == nil)
        y = z;
    else
        y = RBTreeSuccessor(z);

    if(y->left != nil)
        x = y->left;
    else
        x = y->right;

    x->parent = y->parent;

    if(y->parent == nil)
        *root = x;
    else if(y == y->parent->left)
        y->parent->left = x;
    else
        y->parent->right = x;

    if(y != z)
        z->key = y->key;

    for(z = y->parent; z != nil; z = z->parent)
        z->size--;

    if(y->color == BLACK){
        while(x != *root && x->color == BLACK){
            RBNode *p = x->parent;
            if(x == p->left){
                RBNode *s = p->right;
                if(s->color == RED){
                    leftRotate(root,p);
                    p->color = RED;
                    s->color = BLACK;
                } else{
                    if(s->left->color == BLACK && s->right->color == BLACK){
                        s->color = RED;
                        if(p->color == RED){
                            p->color = BLACK;
                            x = *root;
                        }
                        else
                            x = p;
                    } else if(s->right->color == RED){
                        leftRotate(root,p);
                        s->right->color = BLACK;
                        s->color = p->color;
                        p->color = BLACK;
                        x = *root;
                    } else{
                        rightRotate(root,s);
                        s->color = RED;
                        s->parent->color = BLACK;
                    }
                }
            } else{
                RBNode *s = p->left;
                if(s->color == RED){
                    rightRotate(root,p);
                    p->color = RED;
                    s->color = BLACK;
                } else{
                    if(s->left->color == BLACK && s->right->color ==BLACK){
                        s->color = RED;
                        if(p->color == RED){
                            p->color = BLACK;
                            x = *root;
                        }
                        else
                            x = p;
                    } else if(s->left->color == RED){
                        rightRotate(root,p);
                        s->left->color = BLACK;
                        s->color = p->color;
                        p->color = BLACK;
                        x = *root;
                    } else{
                        leftRotate(root,s);
                        s->color = RED;
                        s->parent->color = BLACK;
                    }
                }
            }
        }
        x->color = BLACK;
    }
    nil->parent = NULL;
    return y;
}

RBNode *OSSelect(RBNode *head, int i)
{
    if(head != nil){
        int rank = head->left->size + 1;
        if(rank == i) return head;
        if(rank > i) return OSSelect(head->left, i);
        else return OSSelect(head->right, i - rank);
    }
}

int OSRank(RBNode *root, RBNode *p)
{
    int rank = p->left->size + 1;
    RBNode *q = p;
    while(q != root){
        if(q == q->parent->right)
            rank += q->parent->left->size + 1;
        q = q->parent;
    }
    return rank;
}

RBNode *CreatRBNode(int key)
{
    RBNode *x = (RBNode *)malloc(sizeof(RBNode));
    x->parent = x->left = x->right = nil;
    x->key = key;
    x->size = 1;
    x->color = RED;
    return x;
}

#endif //_RBTREE_H