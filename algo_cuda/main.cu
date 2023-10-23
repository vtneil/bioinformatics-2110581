#include <cstdio>
#include "bio_cuda.cuh"

//#define DEBUG_PRINT
#define MAX_STR_LEN 4000000000ull

char join_char = '*';
score_t match, mismatch, gap_penalty;
sequence_t seq_a, seq_b;
void **F;

int main(int argc, char **argv) {
    if (argc != 6 && argc != 7)
        return 1;

    seq_a.data = argv[4];
    seq_b.data = argv[5];

    seq_a.len = strnlen(seq_a.data, MAX_STR_LEN);
    seq_b.len = strnlen(seq_b.data, MAX_STR_LEN);

    if (seq_a.len < 2 || seq_b.len < 2) { return 2; }

#ifdef _OPENMP
    omp_set_max_active_levels(1);
#endif

    match = strtod(argv[1], NULL);
    mismatch = strtod(argv[2], NULL);
    gap_penalty = strtod(argv[3], NULL);
    if (argc == 7) join_char = *argv[6];

    // seq_a.len >= seq_b.len always
    if (seq_a.len < seq_b.len) {
        size_t tmp = seq_a.len;
        seq_a.len = seq_b.len;
        seq_b.len = tmp;
        seq_a.data = argv[5];
        seq_b.data = argv[4];
    }

    char *o1 = NULL;
    char *o2 = NULL;
    char *om = NULL;
    size_t len;
    score_t score;

    nw_generate();

#ifdef DEBUG_PRINT
    size_t len_a = seq_a.len + 1;
    size_t len_b = seq_b.len + 1;

    printf("    ");
    for (size_t j = 0; j < len_b; ++j) {
        printf("%4zu", j);
    }
    printf("\n");

    for (size_t i = 0; i < len_a; ++i) {
        printf("%4zu", i);
        for (size_t j = 0; j < len_b; ++j) {
            printf("%4.0f", ((score_t (*)[len_b]) F)[i][j]);
        }
        printf("\n");
    }
#endif

    nw_backtrack(&o1, &o2, &om,
                 &len, &score);

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
