/*
 * Description
 * 勤奋的小明为了预习下学期的数据库课程，决定亲自实现一个简单的数据库系统。
 * 该数据库系统需要处理用户的数据库插入和查询语句，并输出相应的输出。
 * 具体来说，用户的输入共包含若干条插入语句和查询语句。
 * 其中每条插入语句包含一个主键（唯一标识）id和一个非负整数aid，表示在数据库中插入一个主键为id，属性值为aid的条目。
 * 每条查询语句包含一个非负整数k，表示在数据库总查询是否有条目属性值为k，
 * 若存在条目属性值为k，则输出该条目对应的主键（输入保证至多有一个条目满足要求），
 * 否则输出一个-1表示不存在这样的条目。
 * 
 * Input 
 * 首先是若干行插入语句，每行的格式为：
 * INSERT id aid
 * 紧接着若干行查询语句，每行的格式为：
 * FIND k
 * 最后单独的一行EXIT表示输入结束。
 * 数据规模：
 * 插入语句和查询语句分别不超过10^6条。
 * 0≤id,aid,k≤10^9
 * 
 * Output 
 * 对每条查询语句输出一行，每行输出若干个数字，表示查询的结果。
 * 若存在满足条件的条目，则输出该条目的主键，否则该行输出一个-1表示没有满足条件的条目。
 * */

#include <stdio.h>
#include <stdlib.h>
int comp(const void * a,const void *b);
int BinarySearch(int start,int end,const int k);
typedef struct database
{
	int id,aid;
} database;
database DB[1000000];
 
int main()
{
	char lookhead;
	int k;
	int tail = 0;
	int sorted = 0;
	
	lookhead = getchar();
	while(lookhead != 'E'){
		switch(lookhead){
			case 'I':
				scanf("NSERT %d %d",&DB[tail].id,&DB[tail].aid);
				tail++;
				break;
			case 'F':
				if(sorted == 0){
					qsort(DB,tail,sizeof(database),comp);
					sorted = 1;
				}
				scanf("IND %d",&k);
				printf("%d\n",BinarySearch(0,tail-1,k));
				break;
		}
		lookhead = getchar();
	}
}

int comp(const void * a,const void *b)
{
	database p = *(database *)a;
	database q = *(database *)b;
	if(p.aid < q.aid) return -1;
	else if(p.aid > q.aid) return 1;
	else return 0;
}

int BinarySearch(int start,int end,const int k)
{
	if(start > end || DB[start].aid > k || DB[end].aid < k) return -1;
	int mid = (start + end) / 2;
	if(DB[mid].aid == k) return DB[mid].id;
	else if(DB[mid].aid > k) return BinarySearch(start,mid-1,k);
	else return BinarySearch(mid+1,end,k);
}
