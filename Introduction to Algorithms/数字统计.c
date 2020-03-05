/* 
 * Description
 * 给定n个整数，请统计出每个整数出现的次数，按出现次数从多到少的顺序输出。
 * 
 * Input
 * 输入的第一行包含一个整数n，表示给定数字的个数。
 * 第二行包含n个整数a1,a2,...,an，相邻的整数之间用一个空格分隔，表示所给定的整数。
 * 数据规模：
 * 1≤n≤1000
 * 1≤ai≤10^9
 * 
 * Output 
 * 输出多行，每行包含两个整数，分别表示一个给定的整数和它出现的次数。按出现次数递减的顺序输出。
 * 如果两个整数出现的次数一样多，则先输出值较小的，然后输出值较大的。
 * */ 

#include <stdio.h>
#include <stdlib.h>
typedef struct count
{
	long a;
	int count;
	struct count *next;
} Count;

int main()
{
	int n;
	Count *head, *search, *pnew;
	head = (Count *)malloc(sizeof(Count));
	head->next = NULL;
	
	scanf("%d",&n);
	while(n--){
		long read;
		scanf("%ld",&read);
		search = head->next;
		while(search != NULL && search->a != read)
			search = search->next;
			
		if(search != NULL)
			search->count++;
		else{
			pnew=(Count *)malloc(sizeof(Count));
			pnew->a = read;
			pnew->count = 1;
			pnew->next = NULL;
		}
	}
	
	int swapped = 1;
	while(swapped){
		swapped = 0;
		Count *p = head;
		Count *q = p->next;
		Count *r = q->next;
		while(q != NULL && r != NULL){
			if(q->count < r->count || q->count == r->count && q->a > r->a){
				swapped = 1;
				q->next = r->next;
				r->next = q;
				p->next = r;
			}
			p = p->next;
			q = p->next;
			r = q->next;
		}
	}
	
	search = head->next;
	while(search != NULL){
		printf("%ld %d\n",search->a,search->count);
		search = search->next;
	}
	return 0;
}
