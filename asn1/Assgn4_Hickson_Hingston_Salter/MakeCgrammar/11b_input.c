int main()
{
   int mark;
   char pass;
   scanf("%d",&mark);
   if (mark > 40)
   {
      pass = 'y';
      printf("You passed with:%d", mark);
   }
   else
   {
      pass = 'n';
      printf("You failed with:%d", mark);
   }
   return 0;
}
