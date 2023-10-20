#include <stdio.h>
#include "bio_cpu.h"

//#define DEBUG_PRINT
#define MAX_STR_LEN 4000000000ull

score_t match, mismatch;

int xmain(int argc, char **argv) {
    size_t row = 5;
    size_t col = 3;
    void **F = new_matrix(row, col);
    for (size_t i = 0; i < row; ++i) {
        for (size_t j = 0; j < col; ++j) {
            ((score_t (*)[3]) F)[i][j] = (i * col) + j;
        }
    }

    for (size_t i = 0; i < row; ++i) {
        for (size_t j = 0; j < col; ++j) {
            printf("%.0f ", ((score_t (*)[col]) F)[i][j]);
        }
        printf("\n");
    }
    printf("---------\n");

    void **diag = to_diagonal(F, row, col);

    for (size_t i = 0; i < 7; ++i) {
        for (size_t j = 0; j < 3; ++j) {
            printf("%.0f ", ((score_t (*)[3]) diag)[i][j]);
        }
        printf("\n");
    }
    printf("---------\n");

    F = from_diagonal(&F, diag, row, col);

    for (size_t i = 0; i < row; ++i) {
        for (size_t j = 0; j < col; ++j) {
            printf("%.0f ", ((score_t (*)[col]) F)[i][j]);
        }
        printf("\n");
    }

    free(diag);
    free(F);

    return 0;
}

int main(int argc, char **argv) {
    if (argc != 6 && argc != 7)
        return 1;

    match = strtod(argv[1], NULL);
    mismatch = strtod(argv[2], NULL);
    score_t gap_penalty = strtod(argv[3], NULL);

    const char *seq_1 = argv[4];
    const char *seq_2 = argv[5];

    size_t len_1 = strnlen(seq_1, MAX_STR_LEN);
    size_t len_2 = strnlen(seq_2, MAX_STR_LEN);

    if (len_1 < 2 || len_2 < 2) { return 2; }

    // len_1 >= len_2 always
    if (len_1 < len_2) {
        size_t tmp = len_1;
        len_1 = len_2;
        len_2 = tmp;
        seq_1 = argv[5];
        seq_2 = argv[4];
    }

    void **F = NULL;
    char *o1 = NULL;
    char *o2 = NULL;
    char *om = NULL;
    size_t len;
    score_t score;

    nw_generate(&F,
                seq_1, seq_2, len_1, len_2,
                gap_penalty);

#ifdef DEBUG_PRINT
    size_t len_a = len_1 + 1;
    size_t len_b = len_2 + 1;

    for (size_t i = 0; i < len_a; ++i) {
        for (size_t j = 0; j < len_b; ++j) {
            printf("%4.0f", ((score_t (*)[len_b]) F)[i][j]);
        }
        printf("\n");
    }
#endif

    nw_backtrack(&o1, &o2, &om, &len, &score,
                 F,
                 seq_1, seq_2, len_1, len_2,
                 gap_penalty);

    (void) (len);

    printf("%f\n", score);
    printf("%s\n", o1);
    if (argc == 7)
        printf("%s\n", om);
    printf("%s\n", o2);

    free(F);
    free(o1);
    free(o2);
    free(om);

    return 0;
}
