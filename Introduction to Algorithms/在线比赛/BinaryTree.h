//
// Created by JohnHe on 2019/11/5.
//

#ifndef BINARYTREE
#define BINARYTREE

typedef struct BTNode{
    struct BTNode *parent, *left, *right;
    int key;
    int size;
}BTNode;
BTNode *nil;

BTNode *InitBinaryTree()
{
    nil = (BTNode *)malloc(sizeof(BTNode));
    nil->parent = nil->left = nil->right =NULL;
    nil->key = -1;
    nil->size = 0;
    BTNode *root = nil;
    return root;
}

void Print(BTNode *x)//根据结构修改
{
    printf("key = %3d, size = %2d, ", x->key, x->size);
    printf("parent = %3d, left = %3d, right = %3d\n",x->parent->key,x->left->key,x->right->key);
}

void InOrderTreeWalk(BTNode *x)
{
    if(x != nil){
        InOrderTreeWalk(x->left);
        Print(x);
        InOrderTreeWalk(x->right);
    }
}

void PreOrderTreeWalk(BTNode *x)
{
    if(x != nil){
        Print(x);
        PreOrderTreeWalk(x->left);
        PreOrderTreeWalk(x->right);
    }
}

void PostOrderTreeWalk(BTNode *x)
{
    if(x != nil){
        PostOrderTreeWalk(x->left);
        Print(x);
        PostOrderTreeWalk(x->right);
    }
}

BTNode *TreeSearch(BTNode *x, int key)
{
    while(x != nil && x->key != key){
        if(x->key > key)
            x = x->left;
        else
            x = x->right;
    }
    return x;
}

BTNode *TreeMinimum(BTNode *x)
{
    while(x->left != nil)
        x = x->left;
    return x;
}

BTNode *TreeMaximum(BTNode *x)
{
    while(x->right != nil)
        x = x->right;
    return x;
}

BTNode *TreeSuccessor(BTNode *x)
{
    if(x->right != nil)
        return TreeMinimum(x->right);
    BTNode *y = x->parent;
    while(y != nil && x == y->right){
        x = y;
        y = y->parent;
    }
    return y;
}

BTNode *TreePredecessor(BTNode *x)
{
    if(x->left != nil)
        return TreeMaximum(x->left);
    BTNode *y = x->parent;
    while(y != nil && x == y->left){
        x = y;
        y = y->parent;
    }
    return y;
}

void leftRotate(BTNode **root, BTNode *x)
{
    BTNode *y = x->right;
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

void rightRotate(BTNode **root, BTNode *x)
{
    BTNode *y = x->left;
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

void TreeInsert(BTNode **root, BTNode *z)
{
    BTNode *x = *root, *y = nil;
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
    }
    else if(z->key < y->key)
        y->left = z;
    else
        y->right = z;
}

BTNode *TreeDelete(BTNode **root, BTNode *z)
{
    BTNode *x, *y;
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

    for(z = y->parent; z != nil; z = z->parent)
        z->size--;

    return y;
}

BTNode *OSSelect(BTNode *head, int i)
{
    if(head != nil){
        int rank = head->left->size + 1;
        if(rank == i) return head;
        if(rank > i) return OSSelect(head->left, i);
        else return OSSelect(head->right, i - rank);
    }
    else return nil;
}

int OSRank(BTNode *root, BTNode *p)
{
    int rank = p->left->size + 1;
    BTNode *q = p;
    while(q != root){
        if(q == q->parent->right)
            rank += q->parent->left->size + 1;
        q = q->parent;
    }
    return rank;
}

BTNode *CreatNode(int key)
{
    BTNode *x = (BTNode *)malloc(sizeof(BTNode));
    x->parent = x->left = x->right = nil;
    x->key = key;
    x->size = 1;
    return x;
}

#endif //BINARYTREE