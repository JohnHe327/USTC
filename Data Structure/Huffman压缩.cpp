#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <cstring>
typedef struct{
	unsigned int weight;
	unsigned int parent,lch,rch;
	int ele;
} HTNode,*HuffTree;
typedef char * * HuffCode;

void Select(HuffTree &HT,unsigned int i,unsigned int &s1,unsigned int &s2)
{
	unsigned int S=1;
	while(HT[S].parent!=0) S++;
	s1=S;
	S++;
	while(HT[S].parent!=0) S++;
	if(HT[S].weight>HT[s1].weight) s2=S;
	else{
		s2=s1;s1=S;
	}
	for(S++;S<=i;S++){
		if(HT[S].parent==0){
			if(HT[S].weight<HT[s1].weight){
				s2=s1;s1=S;
			}
			else if(HT[S].weight<HT[s2].weight)
				s2=S;
		}
	}
}

void HuffmanCoding(HuffTree &HT,HuffCode &HC,unsigned int *w,unsigned int n)
{
	if(n<=1) return;
	unsigned int *a=w;
	unsigned int m=2*n-1;
	HT=(HuffTree)malloc((m+1)*sizeof(HTNode));
	HuffTree p;
	unsigned int i;
	for(p=HT+1,i=1;i<=n;w++)
	if(*w!=0){
		*p={*w,0,0,0,w-a};
		i++;
		p++;
	}
	for(;i<=m;i++,p++)
		*p={0,0,0,0,0};//初始化
	
	for(i=n+1;i<=m;i++){
		unsigned int s1,s2;
		Select(HT,i-1,s1,s2);
		HT[s1].parent=i;
		HT[s2].parent=i;
		HT[i].lch=s1;
		HT[i].rch=s2;
		HT[i].weight=HT[s1].weight+HT[s2].weight;
	}//构建 
	
	HC=(HuffCode)malloc((n+1)*sizeof(char *));
	char *cd=(char*)malloc(sizeof(char)*n);//cd指向n*char数组 
	cd[n-1]='\0';
	
	for(i=1;i<=n;i++){
		unsigned int start=n-1;
		unsigned int c,f;
		for(c=i,f=HT[i].parent;f!=0;c=f,f=HT[f].parent){
			if(HT[f].lch==c) cd[--start]='0';
			else cd[--start]='1';
		}
		HC[i]=(char *)malloc((n-start)*sizeof(char));
		strcpy(HC[i],&cd[start]);
		//puts(HC[i]); 
	}
	free(cd);
}

void WRITE(FILE *fout,char *temp)
{
	char OUT;
	OUT=(temp[0]-'0')<<7|(temp[1]-'0')<<6|(temp[2]-'0')<<5|(temp[3]-'0')<<4|(temp[4]-'0')<<3|(temp[5]-'0')<<2|(temp[6]-'0')<<1|(temp[7]-'0');
	fputc(OUT,fout);
	unsigned int i=8;
	while(temp[i]!='\0'){
		temp[i-8]=temp[i];
		i++;
	}
	temp[i-8]='\0';
}

int main()
{
	char filename[100]="[4]test.txt";
	printf("请输入文件名：");
	scanf("%s",filename); 
	char ofn[100];
	strcpy(ofn,filename); 
	HuffTree HT;
	HuffCode HC;
	int ch;
	unsigned int weight[256]={0};
	FILE* fin = fopen(filename, "rb");
	FILE* fout= fopen(strcat(filename,".huff.txt"),"wb");
	unsigned int count=0;
	
	//读取 
	while((ch=fgetc(fin))!=EOF){
		if(weight[ch]==0) count++;
		weight[ch]++;
	}
	
	printf("\n\n编码信息：\n"); 
	HuffmanCoding(HT,HC,weight,count);
	fprintf(fout,"%u %u\n",HT[2*count-1].weight,count);//字节数 编码条数 
	unsigned int i;
	for(i=1;i<=count;i++){
		int HClen=strlen(HC[i]);
		fprintf(fout,"%d %d %s\n",HT[i].ele,HClen,HC[i]);
	}
	
	char temp[3*count]="\0";
	printf("\n\n编码数据流：\n");
	fseek(fin,0,0);
	unsigned int point;
	while((ch=fgetc(fin))!=EOF){
		point=1;
		while(HT[point].ele!=ch) point++;
		strcat(temp,HC[point]);
		while(strlen(temp)>=8){
			WRITE(fout,temp);
		}
	}
	strcat(temp,"0000000");
	while(strlen(temp)>=8) WRITE(fout,temp);
	
	fclose(fin);
	fclose(fout);
	return 0;
}
