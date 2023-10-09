#include <stdio.h>
#include "bio_cpu.h"

#define MAX_STR_LEN 1024
//#define GAP_PENALTY DEFAULT_GAP_PENALTY
#define GAP_PENALTY (-2)


int main() {
    const char seq_1[] = "GATTACGGTCGCGGC";
    const char seq_2[] = "GTCGACGCAATGCCCTAAA";

    size_t len_1 = strnlen(seq_1, MAX_STR_LEN);
    size_t len_2 = strnlen(seq_2, MAX_STR_LEN);

    printf("Sequence 1 (Length %zu): %s\n", len_1, seq_1);
    printf("Sequence 2 (Length %zu): %s\n", len_2, seq_2);

    int **F = NULL;
    char *o1 = NULL;
    char *o2 = NULL;
    char *om = NULL;
    size_t len;
    int score;

    nw_generate(&F,
                seq_1, seq_2, len_1, len_2,
                default_comparator, GAP_PENALTY);

    printf("       ");
    for (size_t j = 0; j < len_2; ++j) {
        printf("%6c", seq_2[j]);
    }
    printf("\n ");
    for (size_t j = 0; j < len_2 + 1; ++j) {
        printf("%6d", F[0][j]);
    }
    printf("\n");

    for (size_t i = 1; i < len_1 + 1; ++i) {
        printf("%c", seq_1[i - 1]);
        for (size_t j = 0; j < len_2 + 1; ++j) {
            printf("%6d", F[i][j]);
        }
        printf("\n");
    }

    nw_backtrack(&o1, &o2, &om, &len, &score,
                 F,
                 seq_1, seq_2, len_1, len_2,
                 default_comparator, GAP_PENALTY);

    printf("Alignment Score: %d\n", score);
    printf("Aligned Sequence 1: %s\n", o1);
    printf("   Matching String: %s\n", om);
    printf("Aligned Sequence 2: %s\n", o2);

    free_matrix(F, len_1 + 1, 0);
    free_string(o1, 0);
    free_string(o2, 0);
    free_string(om, 0);

    return 0;
}
