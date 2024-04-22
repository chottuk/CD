%{
#include <stdio.h>
#include <stdlib.h>

int prime_count = 0;

// Function to check if a number is prime
int is_prime(int num) {
    if (num <= 1) return 0;  // 0 and 1 are not prime
    if (num <= 3) return 1;  // 2 and 3 are prime

    // Check if the number is divisible by any number from 2 to sqrt(num)
    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0) {
            return 0;  // If divisible, not prime
        }
    }
    return 1;  // If not divisible, prime
}
%}

%%

[0-9]+ {
    int num = atoi(yytext);
    if (is_prime(num)) {
        printf("%d is prime.\n", num);
        prime_count++;
    } else {
        printf("%d is not prime.\n", num);
    }
}

\n     {
        printf("Total prime numbers counted: %d\n", prime_count);
        prime_count = 0;
    }

.       ;

%%
int yywrap(){ return 1;}

int main() {
    yylex();
    return 0;
}

