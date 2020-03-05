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

void CreatTree(HuffTree &d_tree,int &tlen,char* d_code,int ch_d)
{
	int i=tlen+1;
	int pcode=0,clen=strlen(d_code);
	int ptree=1;
	for(;pcode<clen;pcode++){
		if(d_code[pcode]=='0'){
			if(d_tree[ptree].lch==0){
				d_tree[ptree].lch=i;
				d_tree[i].parent=ptree;
				tlen++;i++;
			}
			ptree=d_tree[ptree].lch;
		}
		else{
			if(d_tree[ptree].rch==0){
				d_tree[ptree].rch=i;
				d_tree[i].parent=ptree;
				tlen++;i++;
			}
			ptree=d_tree[ptree].rch;
		}
	}
	d_tree[ptree].ele=ch_d;
}

int main()
{
	char filename[100]="[4]test.txt";
	printf("请输入文件名：");
	scanf("%s",filename); 
	char ofn[100];
	strcpy(ofn,filename);
	int ch;
	
	FILE* fread = fopen(strcat(filename,".huff.txt"), "rb");
	FILE* fwrite= fopen(strcat(filename,ofn),"wb");
	unsigned int TOTAL,COUNT;
	fscanf(fread,"%u %u",&TOTAL,&COUNT);
	
	char* d_code;
	HuffTree d_tree;
	d_tree=(HuffTree)malloc((2*COUNT)*sizeof(HTNode));
	for(int i=0;i<2*COUNT;i++){
		d_tree[i]={0,0,0,0,0};
	}
	int treelen=1;
	
	for(int i=0;i<COUNT;i++){
		int ch_d,codelen;
		fscanf(fread,"%d%d",&ch_d,&codelen);
		d_code=(char*)malloc(sizeof(char)*codelen);
		fscanf(fread,"%s",d_code);
		CreatTree(d_tree,treelen,d_code,ch_d);
	}
	printf("\n请输入流\n");
	fseek(fread,1,1); 
	int ptree=1;
	while(TOTAL){
		ch=fgetc(fread);
		char codech[8];
		codech[0]=(ch&128)/128+'0';
		codech[1]=(ch&64)/64+'0';
		codech[2]=(ch&32)/32+'0';
		codech[3]=(ch&16)/16+'0';
		codech[4]=(ch&8)/8+'0';
		codech[5]=(ch&4)/4+'0';
		codech[6]=(ch&2)/2+'0';
		codech[7]=(ch&1)/1+'0';
		for(int i=0;i<8&&TOTAL;i++){
			char chtemp=codech[i];
			if((d_tree[ptree].lch||d_tree[ptree].rch)==0){
				fputc(d_tree[ptree].ele,fwrite);
				ptree=1;
				TOTAL--;
			}
			if(chtemp=='0')	ptree=d_tree[ptree].lch;
			else ptree=d_tree[ptree].rch;
		}
	}
	fclose(fread);
	fclose(fwrite);
	return 0;
}
