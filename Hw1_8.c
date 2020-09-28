

#include <stdio.h>

char *strcat(char *dest, const char *src);

int main()
{
    char str1[30] = "Handong Global ";
    char str2[] = "University";
    strcat(str1, str2);
    printf("results: %s\n", str1);

    
    return 0;
}

char *strcat(char *dest, const char *src)
{
    char *pDest;
    char *pSrc;

    pDest = dest;
    pSrc = src;

    while (*pDest != '\0')
    {
        pDest = pDest + 1;
    }

    while (*pSrc != '\0')
    {
        *pDest = *pSrc;

        pDest = pDest + 1;
        pSrc = pSrc + 1;
    }

    return pDest;
}