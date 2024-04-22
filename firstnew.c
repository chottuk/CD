#include <stdio.h>
#include <string.h>


int findFirst(char prods[][10], char *ans, char ch, int n) {
    for (int i = 0; i < n; i++) {
        if (ch == prods[i][0]) {
            if (prods[i][2] >= 'A' && prods[i][2] <= 'Z') {
                int cg = 2;
                while (cg < strlen(prods[i]) && findFirst(prods, ans, prods[i][cg], n) == 1) {
                    cg++;
                }
            } else {
                if (strchr(ans, prods[i][2]) == NULL)
                    strncat(ans, &prods[i][2], 1);
            }
            if (prods[i][2] == '#') {
                return 1;
            }
        }
    }
    return 0;
}

int main() {
    int n;
    printf("enter no of production:- ");
    scanf("%d", &n);
    char prods[n][10];
    printf("enter each production (Enter # for empty)\n");
    for (int i = 0; i < n; i++) {
        scanf("%s", prods[i]);
    }
    int f = 1;
    do {
        printf("enter NON-Terminal to find FIRST\n");
        char ch;
        scanf(" %c", &ch);
        char ans[20] = "";
        findFirst(prods, ans, ch, n);
        printf("First of %c ==> %s\n", ch, ans);
        printf("Next = 1\nExit = 0\n");
        scanf("%d", &f);
    } while (f == 1);
    printf("Thank you!!!\n");
    return 0;
}

