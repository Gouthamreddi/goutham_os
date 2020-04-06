#include<stdio.h>
int main()
{
int bursttime[20],p[20],waitingtime[20],turnarndtime[20];
int i,j,n,total=0,pos,temp;
float avg_wt,avg_tat;
printf("\nEnter number of process:");
scanf("%d",&n);
printf("\nEnter Arrival Time:\n");
for(i=0;i<n;i++)
{
	printf("p%d:",i+1);
    scanf("%d",&bursttime[i]);
    p[i]=i+1;
}
for(i=0;i<n;i++)
{
pos=i;
for(j=0;j<n;j++)
{
	if(bursttime[j]<bursttime[pos])
	pos=j;
}
temp=bursttime[i];
bursttime[i]=bursttime[pos];
bursttime[pos]=temp;
temp=p[i];
p[i]=p[pos];
p[pos]=temp;

}
waitingtime[0]=0;
for(i=1;i<n;i++)
{
    waitingtime[i]=0;
    for(j=0;j<i;j++)
    {
    	waitingtime[i]=waitingtime[i]+bursttime[j];
    	total=total+waitingtime[i];
	}
total+=waitingtime[i];
}

avg_wt=(float)total/n; //average waiting time 
printf("\nProcess\t     Arival Time\tWaiting Time\t      Turnaround Time");
for(i=0;i<n;i++)
{
	turnarndtime[i]=bursttime[i]+waitingtime[i];//calculate turnaround time
    total+=turnarndtime[i];
    printf("\np%d\t\t  %d\t\t    %d\t\t\t%d",p[i],bursttime[i],waitingtime[i],turnarndtime[i]);
}
avg_tat=(float)total/n; //average turnaround time
printf("\n\nAverage Waiting Time=%f",avg_wt);
printf("\nAverage Turnaround Time=%f\n",avg_tat);
}
