// 数码问题
// 在一个 5*5 的网格中，23 个小方块写有数字“1-21”，剩下的两个空白方块代表空位
// 特别地，有三个写有“7”的方块被绑定在一起，组成了一个“7”型块
// 与空位上、下、左、右相邻的方块可以移动到空位中，记为一次行动
// 现给定初始状态与目标状态，要求获得从初始状态到目标状态的合法移动序列

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#define ZERO1 22
#define ZERO2 23

typedef struct Coordinate
{
    int i, j;
} COORDINATE;
typedef struct Actions
{
    int num;
    char act;
} ACTIONS;
typedef struct Node
{
    int state[5][5];
    int f, g, h;
    ACTIONS *act;
    struct Node *parent;
} NODE;
typedef struct Fringe
{
    NODE *pNode;
    struct Fringe *pnext;
} FRINGE;
FRINGE *head;
FRINGE *closedFringe;

int input[5][5];
int goal[5][5];

void readInput(FILE *fp, int arr[5][5])
{
    for (int i = 0; i < 5; i++)
        for (int j = 0; j < 5; j++)
            if (j == 4)
                fscanf(fp, "%d", &arr[i][j]);
            else
                fscanf(fp, "%d,", &arr[i][j]);
}

COORDINATE getCoordinate(int const num, int const arr[5][5])
// 1 <= num <= 21 or
// num == 22: first zero
// num == 23: second zero
{
    COORDINATE cor = {-1, -1};
    if (num <= 0 || num >= 24) // illegal
        return cor;
    else if (num <= 21) // default case
    {
        for (cor.i = 0; cor.i < 5; cor.i++)
            for (cor.j = 0; cor.j < 5; cor.j++)
                if (arr[cor.i][cor.j] == num)
                    return cor;
    }
    else // find zero
    {
        int flag = ZERO1;
        for (cor.i = 0; cor.i < 5; cor.i++)
            for (cor.j = 0; cor.j < 5; cor.j++)
                if (arr[cor.i][cor.j] == 0)
                {
                    if (flag == num)
                        return cor;
                    else
                        flag++;
                }
    }
    return cor;
}

int hamiltonDist(COORDINATE const a, COORDINATE const b)
{
    return (abs(a.i - b.i) + abs(a.j - b.j));
}

int getHeuristic(int const src[5][5], int const dest[5][5])
{
    int sum = 0;
    bool flag = false;
    for (int i = 0; i < 5; i++)
        for (int j = 0; j < 5; j++)
        {
            COORDINATE cor = {i, j};
            if (src[i][j] == 0)
                continue; // do nothing
            else if (src[i][j] == 7)
            {
                if (flag == false)
                {
                    sum += hamiltonDist(cor, getCoordinate(src[i][j], dest));
                    flag = true;
                }
            }
            else
            {
                sum += hamiltonDist(cor, getCoordinate(src[i][j], dest));
            }
        }
    return sum;
}

void appendFringe(NODE *n)
{
    FRINGE *pnew = (FRINGE *)malloc(sizeof(FRINGE));
    pnew->pnext = head->pnext;
    pnew->pNode = n;
    head->pnext = pnew;
}

bool fringeEmpty()
{
    return (head->pnext == NULL);
}

NODE *fringePopMin()
{
    if (fringeEmpty())
        return NULL;

    FRINGE *pre = head; // pointer before min
    FRINGE *min = head->pnext;
    FRINGE *p1 = min;       // pointer before compare
    FRINGE *p2 = p1->pnext; // compare with min

    // find min
    while (p2 != NULL)
    {
        if (p2->pNode->f < min->pNode->f)
        {
            pre = p1;
            min = p2;
        }
        p1 = p2;
        p2 = p1->pnext;
    }

    // pop min
    pre->pnext = min->pnext;
    NODE *n = min->pNode;
    min->pnext = closedFringe->pnext;
    closedFringe->pnext = min;
    return n;
}

int exploredIn(int arr[5][5])
{
    FRINGE *p = NULL;
    for (p = closedFringe->pnext; p != NULL; p = p->pnext)
        if (memcmp(arr, p->pNode->state, sizeof(input)) == 0)
            return -1;
    for (p = head->pnext; p != NULL; p = p->pnext)
        if (memcmp(arr, p->pNode->state, sizeof(input)) == 0)
            return 1;
    return 0;
}

void expandNode(NODE *src, COORDINATE z1)
{
    if (z1.i != 0 && src->state[z1.i - 1][z1.j] != 0 && src->state[z1.i - 1][z1.j] != 7) // z1 up
    {
        NODE *pnew = (NODE *)malloc(sizeof(NODE));
        memcpy(pnew, src, sizeof(NODE));
        pnew->state[z1.i][z1.j] = pnew->state[z1.i - 1][z1.j];
        pnew->state[z1.i - 1][z1.j] = 0;
        switch (exploredIn(pnew->state))
        {
        case 0: // complete pnew & add to fringe
            pnew->parent = src;
            pnew->g++;
            pnew->h = getHeuristic(pnew->state, goal);
            pnew->f = pnew->g + pnew->h;
            pnew->act = (ACTIONS *)malloc(sizeof(ACTIONS));
            pnew->act->act = 'd';
            pnew->act->num = pnew->state[z1.i][z1.j];
            appendFringe(pnew);
            break;
        default:
            free(pnew);
        }
    }
    if (z1.i != 4 && src->state[z1.i + 1][z1.j] != 0 && src->state[z1.i + 1][z1.j] != 7) // z1 down
    {
        NODE *pnew = (NODE *)malloc(sizeof(NODE));
        memcpy(pnew, src, sizeof(NODE));
        pnew->state[z1.i][z1.j] = pnew->state[z1.i + 1][z1.j];
        pnew->state[z1.i + 1][z1.j] = 0;
        switch (exploredIn(pnew->state))
        {
        case 0: // complete pnew & add to fringe
            pnew->parent = src;
            pnew->g++;
            pnew->h = getHeuristic(pnew->state, goal);
            pnew->f = pnew->g + pnew->h;
            pnew->act = (ACTIONS *)malloc(sizeof(ACTIONS));
            pnew->act->act = 'u';
            pnew->act->num = pnew->state[z1.i][z1.j];
            appendFringe(pnew);
            break;
        default:
            free(pnew);
        }
    }
    if (z1.j != 0 && src->state[z1.i][z1.j - 1] != 0 && src->state[z1.i][z1.j - 1] != 7) // z1 left
    {
        NODE *pnew = (NODE *)malloc(sizeof(NODE));
        memcpy(pnew, src, sizeof(NODE));
        pnew->state[z1.i][z1.j] = pnew->state[z1.i][z1.j - 1];
        pnew->state[z1.i][z1.j - 1] = 0;
        switch (exploredIn(pnew->state))
        {
        case 0: // complete pnew & add to fringe
            pnew->parent = src;
            pnew->g++;
            pnew->h = getHeuristic(pnew->state, goal);
            pnew->f = pnew->g + pnew->h;
            pnew->act = (ACTIONS *)malloc(sizeof(ACTIONS));
            pnew->act->act = 'r';
            pnew->act->num = pnew->state[z1.i][z1.j];
            appendFringe(pnew);
            break;
        default:
            free(pnew);
        }
    }
    if (z1.j != 4 && src->state[z1.i][z1.j + 1] != 0 && src->state[z1.i][z1.j + 1] != 7) // z1 right
    {
        NODE *pnew = (NODE *)malloc(sizeof(NODE));
        memcpy(pnew, src, sizeof(NODE));
        pnew->state[z1.i][z1.j] = pnew->state[z1.i][z1.j + 1];
        pnew->state[z1.i][z1.j + 1] = 0;
        switch (exploredIn(pnew->state))
        {
        case 0: // complete pnew & add to fringe
            pnew->parent = src;
            pnew->g++;
            pnew->h = getHeuristic(pnew->state, goal);
            pnew->f = pnew->g + pnew->h;
            pnew->act = (ACTIONS *)malloc(sizeof(ACTIONS));
            pnew->act->act = 'l';
            pnew->act->num = pnew->state[z1.i][z1.j];
            appendFringe(pnew);
            break;
        default:
            free(pnew);
        }
    }
}

void expandNode7(NODE *src, COORDINATE z1, COORDINATE z2)
{
    if (z1.i >= 1 && z2.i >= 2 && src->state[z1.i - 1][z1.j] == 7 && src->state[z2.i - 1][z2.j] == 7)
    { // zero up
        NODE *pnew = (NODE *)malloc(sizeof(NODE));
        memcpy(pnew, src, sizeof(NODE));
        pnew->state[z1.i][z1.j] = 7;
        pnew->state[z2.i][z2.j] = 7;
        pnew->state[z1.i - 1][z1.j] = 0;
        pnew->state[z2.i - 2][z2.j] = 0;
        switch (exploredIn(pnew->state))
        {
        case 0: // complete pnew & add to fringe
            pnew->parent = src;
            pnew->g++;
            pnew->h = getHeuristic(pnew->state, goal);
            pnew->f = pnew->g + pnew->h;
            pnew->act = (ACTIONS *)malloc(sizeof(ACTIONS));
            pnew->act->act = 'd';
            pnew->act->num = 7;
            appendFringe(pnew);
            break;
        default:
            free(pnew);
        }
    }
    if (z1.i <= 2 && z2.i <= 2 && src->state[z1.i + 1][z1.j] == 7 && src->state[z2.i + 1][z2.j] == 7)
    { // zero down
        NODE *pnew = (NODE *)malloc(sizeof(NODE));
        memcpy(pnew, src, sizeof(NODE));
        pnew->state[z1.i][z1.j] = 7;
        pnew->state[z2.i][z2.j] = 7;
        pnew->state[z1.i + 1][z1.j] = 0;
        pnew->state[z2.i + 2][z2.j] = 0;
        switch (exploredIn(pnew->state))
        {
        case 0: // complete pnew & add to fringe
            pnew->parent = src;
            pnew->g++;
            pnew->h = getHeuristic(pnew->state, goal);
            pnew->f = pnew->g + pnew->h;
            pnew->act = (ACTIONS *)malloc(sizeof(ACTIONS));
            pnew->act->act = 'u';
            pnew->act->num = 7;
            appendFringe(pnew);
            break;
        default:
            free(pnew);
        }
    }
    if (z1.j >= 2 && z2.j >= 2 && src->state[z1.i][z1.j - 1] == 7 && src->state[z2.i][z2.j - 1] == 7)
    { // zero left
        NODE *pnew = (NODE *)malloc(sizeof(NODE));
        memcpy(pnew, src, sizeof(NODE));
        pnew->state[z1.i][z1.j] = 7;
        pnew->state[z2.i][z2.j] = 7;
        pnew->state[z1.i][z1.j - 2] = 0;
        pnew->state[z2.i][z2.j - 1] = 0;
        switch (exploredIn(pnew->state))
        {
        case 0: // complete pnew & add to fringe
            pnew->parent = src;
            pnew->g++;
            pnew->h = getHeuristic(pnew->state, goal);
            pnew->f = pnew->g + pnew->h;
            pnew->act = (ACTIONS *)malloc(sizeof(ACTIONS));
            pnew->act->act = 'r';
            pnew->act->num = 7;
            appendFringe(pnew);
            break;
        default:
            free(pnew);
        }
    }
    if (z1.j <= 2 && z2.j <= 3 && src->state[z1.i][z1.j + 1] == 7 && src->state[z2.i][z2.j + 1] == 7)
    { // zero right
        NODE *pnew = (NODE *)malloc(sizeof(NODE));
        memcpy(pnew, src, sizeof(NODE));
        pnew->state[z1.i][z1.j] = 7;
        pnew->state[z2.i][z2.j] = 7;
        pnew->state[z1.i][z1.j + 2] = 0;
        pnew->state[z2.i][z2.j + 1] = 0;
        switch (exploredIn(pnew->state))
        {
        case 0: // complete pnew & add to fringe
            pnew->parent = src;
            pnew->g++;
            pnew->h = getHeuristic(pnew->state, goal);
            pnew->f = pnew->g + pnew->h;
            pnew->act = (ACTIONS *)malloc(sizeof(ACTIONS));
            pnew->act->act = 'l';
            pnew->act->num = 7;
            appendFringe(pnew);
            break;
        default:
            free(pnew);
        }
    }
}

NODE *AstarSolve()
{
    NODE *min = NULL;
    while (!fringeEmpty())
    {
        min = fringePopMin();
        if (min->h == 0) // bingo!
            break;

        COORDINATE z1 = getCoordinate(ZERO1, min->state);
        COORDINATE z2 = getCoordinate(ZERO2, min->state);
        expandNode(min, z1);
        expandNode(min, z2);
        expandNode7(min, z1, z2);
    }
    return min;
}

void printAnswer(FILE *fp, NODE *n)
{
    if (n != NULL)
        printAnswer(fp, n->parent);
    if (n != NULL && n->act != NULL)
        fprintf(fp, "(%d,%c);\n", n->act->num, n->act->act);
}

int main()
{
    printf("input file should be placed in '../input/1.txt' and so on, up to 9 files\n");
    printf("goal should be placed in '../input/goal.txt'\n");
    printf("output file will be placed in '../output/' with the same input file name\n");
    printf("press enter to continue\n");
    getchar();

    int i = 1;
    while (i)
    {
        // initialize
        memset(input, 0, sizeof(input));
        memset(goal, 0, sizeof(goal));

        // open file
        char inputFname[32] = "../input/1.txt";
        char inputGoal[32] = "../input/goal.txt";
        char outputFname[32] = "../output/1.txt";
        inputFname[9] = (char)i + '0';
        outputFname[10] = (char)i + '0';

        FILE *fpIn, *fpGoal, *fpOut;
        fpIn = fopen(inputFname, "r");
        if (fpIn == NULL)
        {
            printf("cannot open %s!\n", inputFname);
            break;
        }
        fpGoal = fopen(inputGoal, "r");
        if (fpGoal == NULL)
        {
            printf("cannot open %s!\n", inputGoal);
            break;
        }
        fpOut = fopen(outputFname, "w");
        if (fpOut == NULL)
        {
            printf("cannot create %s!\n", outputFname);
            break;
        }
        readInput(fpIn, input);
        readInput(fpGoal, goal);

        // create root node
        NODE *root = (NODE *)malloc(sizeof(NODE));
        root->act = NULL;
        root->parent = NULL;
        memcpy(root->state, input, sizeof(input));
        root->g = 0;
        root->h = getHeuristic(input, goal);
        root->f = root->g + root->h;

        // init fringe
        head = (FRINGE *)malloc(sizeof(FRINGE));
        head->pnext = NULL;
        head->pNode = NULL;
        appendFringe(root);
        closedFringe = (FRINGE *)malloc(sizeof(FRINGE));
        closedFringe->pnext = NULL;
        closedFringe->pNode = NULL;

        // A*
        NODE *terminate = NULL;
        terminate = AstarSolve();
        printf("finish task %d\n", i);
        printAnswer(fpOut, terminate);

        // clear malloc memory
        FRINGE *p;
        for (p = head->pnext; p != NULL; p = head->pnext)
        {
            head->pnext = p->pnext;
            free(p->pNode->act);
            free(p->pNode);
            free(p);
        }
        free(head);
        for (p = closedFringe->pnext; p != NULL; p = closedFringe->pnext)
        {
            closedFringe->pnext = p->pnext;
            free(p->pNode->act);
            free(p->pNode);
            free(p);
        }
        free(closedFringe);

        // close file
        fclose(fpIn);
        fclose(fpOut);
        fclose(fpGoal);
        i++;
    }
    return 0;
}
