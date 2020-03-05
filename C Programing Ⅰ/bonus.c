#include <stdio.h>
int main()
{
	int profit,I;
	float bonus;
	printf("profit:");
	scanf("%d",&profit);
	I=(profit-1)/100000;
	switch(I)
	{
		case 0:
    		bonus=profit*0.1;
        	break;
		case 1:
        	bonus=100000*0.1+(profit-100000)*0.075;
        	break;
		case 2:
		case 3:
        	bonus=100000*0.1+100000*0.075+(profit-200000)*0.05;
        	break;
		case 4:
		case 5:
        	bonus=100000*0.1+100000*0.075+200000*0.05+(profit-400000)*0.03;
        	break;
		case 6:
		case 7:
		case 8:
		case 9:
        	bonus=100000*0.1+100000*0.075+200000*0.05+200000*0.03+(profit-600000)*0.015;
        	break;
		default:
        	bonus=100000*0.1+100000*0.075+200000*0.05+200000*0.03+400000*0.015+(profit-1000000)*0.01;
        	break;
	}
	
	printf("bonus=%.2f",bonus);
	return 0;
}

/*
#include <stdio.h>
int main()
{
	int profit,I;
	float bonus;
	printf("profit:");
	scanf("%d",&profit);
	I=(profit-1)/100000;
	
	if (I==0) bonus=profit*0.1;
	else if (I==1) bonus=100000*0.1+(profit-100000)*0.075;
	else if (I==2||I==3) bonus=100000*0.1+100000*0.075+(profit-200000)*0.05;
	else if (I==4||I==5) bonus=100000*0.1+100000*0.075+200000*0.05+(profit-400000)*0.03;
	else if (I==6||I==7||I==8||I==9) bonus=100000*0.1+100000*0.075+200000*0.05+200000*0.03+(profit-600000)*0.015;
	else bonus=100000*0.1+100000*0.075+200000*0.05+200000*0.03+400000*0.015+(profit-1000000)*0.01;
	
	printf("bonus=%.2f",bonus);
	return 0;
}
*/ 
