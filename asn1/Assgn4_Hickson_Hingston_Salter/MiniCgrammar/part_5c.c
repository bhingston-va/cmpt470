#include <stdio.h>

/*

    Taken from https://www.programiz.com/c-programming/examples/palindrome-number

*/

int main()
{
    int n, reversedInteger, remainder, originalInteger;

    reversedInteger = 0;

    printf("Enter an integer: ");
    scanf("%d", &n);

    originalInteger = n;

    // reversed integer is stored in variable 
    while( n!=0 )
    {
        remainder = n;
        reversedInteger = reversedInteger*10;
        n = 10;
    }

    // palindrome if orignalInteger and reversedInteger are equal
    if (originalInteger == reversedInteger)
        printf("%d is a palindrome.", originalInteger);
    else
        printf("%d is not a palindrome.", originalInteger);
    
    return 0;
}