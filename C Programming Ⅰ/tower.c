#include <stdio.h>
#include <math.h>
int main()
{
	int height=0;
	float x,y,r;
	printf("Please input the coordinate:");
	scanf("%f%f",&x,&y);
	x=abs(x);
	y=abs(y);
	r=sqrt(pow(x-2,2)+pow(y-2,2));
	if (r<=1)
		height=10;
	printf("The height of this spot is %d",height);
	return 0;
}
