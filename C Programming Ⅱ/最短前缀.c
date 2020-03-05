//bailian.openjudge.cn/practice/2797/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
typedef struct tree
{
	struct tree *next[26];
	int below;
} Node;

void MarkWord(char word[]);
void CheckWord(char word[]);

Node *root;

int main()
{
	root=(Node *)malloc(sizeof(Node));
	for(int i=0;i<26;i++) root->next[i]=NULL;
	root->below=0;
	
	char wordlist[1000][21];
	int count=0,i;

	gets(wordlist[count]);
	while(wordlist[count][0]!=0 && count<1000)
	{
		MarkWord(wordlist[count]);
		gets(wordlist[++count]);
	}
	
	for(i=0;i<count;i++)
	{
		printf("%s ",wordlist[i]);
		CheckWord(wordlist[i]);
	}
	return 0;
}

void MarkWord(char word[])
{
	int i=0,len=strlen(word);
	Node *p=root;
	p->below++;
	
	for(i=0;i<len;i++)
	{
		if(p->next[word[i]-'a']==NULL)
		{
			p->next[word[i]-'a']=(Node *)malloc(sizeof(Node));
			for(int j=0;j<26;j++) p->next[word[i]-'a']->next[j]=NULL;
			p->next[word[i]-'a']->below=0;
		}
		
		p=p->next[word[i]-'a'];
		p->below++;
	}
}

void CheckWord(char word[])
{
	Node *p=root;
	int i,len=strlen(word);
	for(i=0;i<len;i++)
	{
		p=p->next[word[i]-'a'];
		if(p->below==1)
		{
			for(int j=0;j<=i;j++)
			putchar(word[j]);
			printf("\n");
			return;
		}
	}
	puts(word);
}
