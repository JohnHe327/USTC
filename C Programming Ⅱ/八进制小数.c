//bailian.openjudge.cn/practice/2765
#include <stdio.h>
int main()
{
	int oct[14] = {0}, dec[42] = {0};
	int o2d[14][42] = {0};
	int ioct , idec , i , j , octtail , dectail;
	char temp;
	
	o2d[0][0]=1;
	o2d[0][1]=2;
	o2d[0][2]=5;
	for(i = 1; i < 14; i++)
	{
		o2d[i][1] += o2d[i-1][0] % 8 * 10 + o2d[i-1][1];
		o2d[i][0] += o2d[i-1][0] / 8;
		for(j = 1; j < 41; j++)
		{
			o2d[i][j+1] += o2d[i][j] % 8 * 10 + o2d[i-1][j+1];
			o2d[i][j] /= 8;
		}
		o2d[i][j] /= 8;
	}
	
	getchar();
	getchar();
	
	for(ioct = 0; ioct < 14; ioct++)
	{
		temp = getchar();
		if(temp != '\n')
				oct[ioct] = temp - '0';
		else break;
	}
	
	for(ioct = 0; ioct < 14; ioct++)
	for(idec = 0; idec < 42; idec++)
	dec[idec] += oct[ioct] * o2d[ioct][idec];
	
	for(idec = 41; idec > 0; idec--)
	{
		dec[idec-1] += dec[idec] / 10;
		dec[idec] %= 10;
	}
	
	for(idec = 41; idec >= 0; idec--)
	if(dec[idec] != 0)
	{
		dectail = idec + 1;
		break;
	}
	for(ioct = 13; ioct >= 0; ioct--)
	if(oct[ioct] != 0)
	{
		octtail = ioct + 1;
		break;
	}
	
	printf("0.");
	for(ioct = 0; ioct < octtail; ioct++) printf("%d",oct[ioct]);
	printf(" [8] = 0.");
	for(idec = 0; idec < dectail; idec++) printf("%d",dec[idec]);
	printf(" [10]");

	return 0;
}
