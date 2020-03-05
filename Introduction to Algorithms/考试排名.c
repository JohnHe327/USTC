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
typedef struct stu
{
	long id;
	int math;
	int english;
	int total;
	struct stu *next, *pre;
} stu;
int Comp(stu *q,stu *r);
void Qsort(stu *head, stu *tail);
void Swap(stu *p,stu *q);

int main()
{
	long n;
	stu *head, *pnew, *tail, *search;
	head = (stu *)malloc(sizeof(stu));
	head->next = NULL;
	head->pre = NULL;
	tail = head;
	
	scanf("%ld",&n);
	while(n--){
		pnew=(stu *)malloc(sizeof(stu));
		scanf("%ld %d %d",&pnew->id,&pnew->math,&pnew->english);
		pnew->total = pnew->math + pnew->english;
		pnew->next = NULL;
		pnew->pre = tail;
		tail->next = pnew;
		tail = tail->next;
	}
	
	Qsort(head->next,tail);
	
	search = head;
	while(search = search->next)
		printf("%ld ",search->id);
	return 0;
}

void Qsort(stu *head, stu *tail)
{
	if(head == tail) return;
	
	stu *front = head->pre, *back = head;
	while(back != tail){
		if(Comp(tail,back)){
			front = front->next;
			Swap(front,back);
		}
		back = back->next;
	}
	front = front->next;
	Swap(front,tail);
	
	if(front != head) Qsort(head,front->pre);
	if(front != tail) Qsort(front->next,tail);
}

int Comp(stu *q,stu *r)
{
	return(q->total < r->total
				|| q->total == r->total && q->math < r->math
				|| q->total == r->total && q->math == r->math && q->english < r->english
				|| q->math == r->math && q->english == r->english && q->id < r->id
			);
}

void Swap(stu *p,stu *q)
{
	if(p == q) return;
	long id;
	int math,english,total;
	id = p->id;
	math = p->math;
	english = p->english;
	total = p->total;
	
	p->id = q->id;
	p->math = q->math;
	p->english = q->english;
	p->total = q->total;
	
	q->id = id;
	q->math = math;
	q->english = english;
	q->total = total;
}
