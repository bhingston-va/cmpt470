int main()
{
   char fruit;
   printf("Which one is your favourite fruit:\n");
   printf("1) Apples\n");
   printf("2) Bananas\n");
   printf("3) Cherries\n");
   scanf("%c",&fruit);
   switch (fruit)
   {
      case 1:
         printf("You like apples\n");
         break;
      case 2:
         printf("You like bananas\n");
         break;
      case 3:
         printf("You like cherries\n");
         break;
      default:
         printf("You entered an invalid choice\n");
   }
   return 0;
}
