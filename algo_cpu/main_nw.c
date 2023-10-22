#include <stdio.h>
#include "bio_cpu.h"

//#define DEBUG_PRINT
#define MAX_STR_LEN 4000000000ull

score_t match, mismatch, gap_penalty;
static sequence_t s1, s2;

int main(int argc, char **argv) {
    if (argc != 6 && argc != 7)
        return 1;

    s1.data = argv[4];
    s2.data = argv[5];

    s1.len = strnlen(s1.data, MAX_STR_LEN);
    s2.len = strnlen(s2.data, MAX_STR_LEN);

    if (s1.len < 2 || s2.len < 2) { return 2; }

    match = strtod(argv[1], NULL);
    mismatch = strtod(argv[2], NULL);
    gap_penalty = strtod(argv[3], NULL);

    // s1.len >= s2.len always
    if (s1.len < s2.len) {
        size_t tmp = s1.len;
        s1.len = s2.len;
        s2.len = tmp;
        s1.data = argv[5];
        s2.data = argv[4];
    }

    void **F = NULL;
    char *o1 = NULL;
    char *o2 = NULL;
    char *om = NULL;
    size_t len;
    score_t score;

    nw_generate(&F, &s1, &s2);

#ifdef DEBUG_PRINT
    size_t len_a = s1.len + 1;
    size_t len_b = s2.len + 1;

    for (size_t i = 0; i < len_a; ++i) {
        for (size_t j = 0; j < len_b; ++j) {
            printf("%4.0f", ((score_t (*)[len_b]) F)[i][j]);
        }
        printf("\n");
    }
#endif

    nw_backtrack(&o1, &o2, &om, &len, &score,
                 F, &s1, &s2);

    printf("%zu\n", len);
    printf("%.12f\n", score);
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
