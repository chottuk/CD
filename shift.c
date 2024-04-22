#include <stdio.h>
#include <string.h>

struct ProductionRule {
    char left[10];
    char right[10];
};

int main() {
    char input[20], stack[50], temp[50], ch[2], *token1, *token2, *substring;
    int i, j, stack_length, substring_length, stack_top, N = 0;
    struct ProductionRule rules[10];

    stack[0] = '\0';
    printf("\nEnter the number of production rules: ");
    scanf("%d", &N);
    printf("\nEnter the production rules (in the form 'left->right'): \n");
    for (i = 0; i < N; i++) {
        scanf("%s", temp);
        token1 = strtok(temp, "->");
        token2 = strtok(NULL, "->");
        strcpy(rules[i].left, token1);
        strcpy(rules[i].right, token2);
    }
    printf("\nEnter the input string: ");
    scanf("%s", input);

    i = 0;
    while (1) {
        if (i < strlen(input)) {
            ch[0] = input[i];
            ch[1] = '\0';
            i++;
            strcat(stack, ch);
            printf("%s\t", stack);
            printf("%s\t", input + i);
            printf("Shift %s\n", ch);
        }
        
        
        for (j = 0; j < N; j++) {

            substring = strstr(stack, rules[j].right);
            if (substring != NULL) {
                // Replace the matched substring with the left-hand side of the production rule
                stack_length = strlen(stack);
                substring_length = strlen(substring);
                stack_top = stack_length - substring_length;
                stack[stack_top] = '\0';
                strcat(stack, rules[j].left);
                printf("%s\t", stack);
                printf("%s\t", input + i);
                printf("Reduce %s->%s\n", rules[j].left, rules[j].right);
                j = -1; // Restart the loop to ensure immediate reduction of the newly derived production rule
            }
        }
        if (strcmp(stack, rules[0].left) == 0 && i == strlen(input)) {
            printf("\nAccepted\n");
            break;
        }
        if (i == strlen(input)) {
            printf("\nNot Accepted\n");
            break;
        }
    }

    return 0;
}


















//SAMPLE OUTPUT:
//
//productions:
/*E=TD
D=+TD
D=$
T=FS
S=*FS
S=$
F=(E)
F=a
//
//FOLLOW(E)=FOLLOW(D)={),$}
//FOLLOW(T)=FOLLOW(S)={+,),$}
//FOLLOW(F)={+,*,),$} */
