// X 数独问题
// 每行、每列、每宫格及对角线无重复数字
// 输入文件放入 '../input/sudoku01.txt' 中，数字用空格隔开，未知数用0代替
// 自动读入最多01-09九个文件
// 输出文件将用相同文件名放入 '../output/'文件夹中
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int question[9][9];  // -1 means unsolved, 0-8 means solved
int answer[9][9];    // stores 0-8, +1 before output
bool takenRow[9][9]; // taken[i][j] = true <--> number j was taken in row i
bool takenCol[9][9]; // taken[i][j] = true <--> number j was taken in col i
bool takenBox[9][9]; // taken[i][j] = true <--> number j was taken in bok i
bool takenX[2][9];   // taken[i][j] = true <--> number j was taken in X i
bool solved[9][9];
bool finish;
int step;

int InBox(int row, int col) // return which box does (row, col) belong to
{
    return row / 3 * 3 + col / 3;
}

void Mark(int row, int col, bool status)
{
    takenRow[row][answer[row][col]] = status;
    takenCol[col][answer[row][col]] = status;
    takenBox[InBox(row, col)][answer[row][col]] = status;
    if (row == col)
        takenX[0][answer[row][col]] = status;
    if (row + col == 8)
        takenX[1][answer[row][col]] = status;
}

void Input(FILE *fpIn)
{
    for (int i = 0; i < 9; i++)
    {
        for (int j = 0; j < 9; j++)
        {
            fscanf(fpIn, "%d", &question[i][j]);
            question[i][j]--;
            if (question[i][j] != -1)
            {
                answer[i][j] = question[i][j];
                Mark(i, j, true);
                solved[i][j] = true;
            }
            else
            {
                solved[i][j] = false;
            }
        }
    }
}

bool available(int row, int col, int num)
{
    return (takenRow[row][num] == false                        // num not in row
            && takenCol[col][num] == false                     // num not in col
            && takenBox[InBox(row, col)][num] == false         // num not in box
            && ((row != col) || (takenX[0][num] == false))     // not '\' or num not in '\'
            && ((row + col != 8) || (takenX[1][num] == false)) // not '/' or num not in '/'
    );
}

int getNextPossibleAns(int row, int col, int start)
{
    for (int i = start; i < 9; i++)
        if (available(row, col, i))
            return i;
    return -1;
}

int getNextUnsolved()
// 0-80: unsolved
// 81: all solved
// -1: no answer
{
    int i;
    for (i = 0; i < 81; i++)
        if (!solved[i / 9][i % 9])
            break;
    
    // heuristic: minimum remaining values
    int degreei = 0;
    for (int try = 0; try < 9; try ++)
        if (available(i / 9, i % 9, try))
            degreei++;
    for (int j = i + 1; j < 81; j++)
        if (!solved[j / 9][j % 9]) // j unsolved
        {
            int degreej = 0;
            for (int try = 0; try < 9; try ++)
                if (available(j / 9, j % 9, try))
                    degreej++;
            if (degreej == 0) // forward checking
                return -1;
            if (degreej < degreei)
                i = j;
        }

    return i;
}

void Solve()
{
    int row, col;
    col = getNextUnsolved();
    if (col == -1) // no answer
        return;
    else if (col == 81) // all solved
    {
        finish = true;
        return;
    }
    row = col / 9;
    col = col % 9;

    while ((answer[row][col] = getNextPossibleAns(row, col, answer[row][col] + 1)) != -1)
    {
        Mark(row, col, 1);
        solved[row][col] = true;
        step++;
        Solve();
        if (finish)
            break;
        solved[row][col] = false;
        Mark(row, col, 0); // back track
    }
}

void Print(int sudoku[][9], FILE *fpOut)
{
    if (finish)
    {
        for (int i = 0; i < 9; i++)
        {
            for (int j = 0; j < 9; j++)
            {
                printf("%d ", 1 + *(*(sudoku + i) + j));
                fprintf(fpOut, "%d ", 1 + *(*(sudoku + i) + j));
            }
            putchar('\n');
            fprintf(fpOut, "\n");
        }
        printf("used %d steps\n", step);
        putchar('\n');
    }
    else
        printf("No answer.\n\n\n");
}

int main()
{
    printf("input file should be placed in '../input/sudoku01.txt' and so on, up to 9 files\n");
    printf("output file will be placed in '../output/' with the same input file name\n");
    printf("press enter to continue\n");
    getchar();

    int i = 1;
    while (i < 10)
    {
        // initialize
        memset(question, -1, 81 * sizeof(int));
        memset(answer, -1, 81 * sizeof(int));
        memset(takenRow, 0, 81 * sizeof(bool));
        memset(takenCol, 0, 81 * sizeof(bool));
        memset(takenBox, 0, 81 * sizeof(bool));
        memset(takenX, 0, 18 * sizeof(bool));
        memset(solved, 0, 81 * sizeof(bool));
        finish = false;
        step = 0;

        // open file
        char inputFname[32] = "../input/sudoku01.txt";
        char outputFname[32] = "../output/soduku01.txt";
        inputFname[16] = (char)i + '0';
        outputFname[17] = (char)i + '0';
        FILE *fpIn, *fpOut;
        fpIn = fopen(inputFname, "r");
        if (fpIn == NULL)
        {
            printf("cannot open %s!\n", inputFname);
            break;
        }
        fpOut = fopen(outputFname, "w");
        if (fpOut == NULL)
        {
            printf("cannot open %s!\n", outputFname);
            break;
        }

        Input(fpIn);
        Solve();
        Print(answer, fpOut);

        fclose(fpIn);
        fclose(fpOut);
        i++;
    }
}
