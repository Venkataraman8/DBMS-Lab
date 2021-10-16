#include<bits/stdc++.h>
#include<stdio.h>
#include<string.h>
using namespace std;

struct fd //functional dependency representation
   {
   int left[8];
   int right[8];
   int lcount,rcount;
   }f[10];


int attrcount,closcount=0,fdcount;
int closure[10];
char attr[10][25];

void getclosure()
{
int i,j,k,l=0,issubset,found;
do
    {
    for(i=0;i<=fdcount;i++)//Checking each functional dependancy
      {
      issubset=1;
      for(j=0;j<f[i].lcount;j++)//select each attr in leftside
         {
         found=0;
         for(k=0;k<closcount;k++) //checking with each element of closure
            {
            if(closure[k]==f[i].left[j])
               {
               found=1;
               break;
               }
            }
         if(found==0)
            {
            issubset=0;
            break;
            }
         }
      if(issubset==1)
         {
         for(k=0;k<f[i].rcount;k++)
            {
            found=0;
            for(j=0;j<closcount;j++)
               {
               if(closure[j]==f[i].right[k])
                  found=1;
               }
            if(found==0)
               {
               closure[closcount]=f[i].right[k];
               closcount++;
               }
            }
         }
      }
    l++;
    }while(l<attrcount);
}


int compare(char temp[25])
  {
   int i;
   for(i=0;i<attrcount;i++)
      {
      if(strcmp(temp,attr[i])==0)
      return i;
      }
  return 0;                                      
  }

int main()
 {
   int i,j,k,attcode;
   char schema[100],temp[45],temp1[50];
   for(i=0;i<10;i++)
      {
      f[i].lcount=0;
      f[i].rcount=0;
      }
   cout<<"\nEnter the schema\n";
   gets(schema);
   attrcount=0;
   for(i=0;schema[i]!='(';i++);

   do
    {
        j=0;
        i++;
        while(schema[i]!=',' && schema[i]!=')')
        {
            temp[j]=schema[i];
            j++;
            i++;
        }
        temp[j]='\0';
        strcpy(attr[attrcount],temp);
        attrcount++;
    }while(schema[i]==',');

   fdcount=-1;
   cout<<"\nEnter the functional dependancies\nEnter 0 to stop\n";
   for(i=0;i<10;i++)
      {
      gets(temp1);
      if(strcmp(temp1,"0")==0)
         break;
      fdcount++;
      j=0;
      if(temp1[0]=='{'||temp1[0]=='(')
         j++;
      do
         {
         if(temp1[j]==',')
             j++;
         k=0;
         while(temp1[j]!=','&&temp1[j]!=')'&&temp1[j]!='}'&&temp1[j]!='-')
            {
            temp[k]=temp1[j];
            k++;
            j++;
            }
         temp[k]='\0';
         attcode=compare(temp);
         f[fdcount].left[f[fdcount].lcount]=attcode;
         f[fdcount].lcount++;
         }while(temp1[j]==',');
      if(temp1[j]==')'||temp1[j]=='}')
          j+=3;
      else if(temp1[j]=='-')
          j+=2;
      if(temp1[j]=='{'||temp1[j]=='(')
          j++;
      do
         {
         if(temp1[j]==',')
             j++;
         k=0;
         while(temp1[j]!=','&&temp1[j]!=')'&&temp1[j]!='}'&&temp1[j]!='\0')
            {
            temp[k]=temp1[j];
            k++;
            j++;
            }
         temp[k]='\0';
         attcode=compare(temp);
         f[fdcount].right[f[fdcount].rcount]=attcode;
         f[fdcount].rcount++;
         }while(temp1[j]==',');

      }
 cout<<"\nEnter an attribute whose closure is to be found\n";
 gets(temp);
 attcode=compare(temp);
 closcount=1;
 closure[0]=attcode;
 getclosure();
 cout<<"Closure of ";
 puts(temp);
 cout<<"\n";
 for(i=0;i<closcount;i++)
    {
    puts(attr[closure[i]]);
    }
 }