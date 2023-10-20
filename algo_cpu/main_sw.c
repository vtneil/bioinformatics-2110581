#include <stdio.h>
#include "bio_cpu.h"

#define MAX_STR_LEN 4000000000ull

static int match, mismatch;

int comparator(char a, char b) { return (a == b) ? match : mismatch; }

int main(int argc, char **argv) {
    if (argc != 6 && argc != 7)
        return 1;

    match = (int) strtol(argv[1], NULL, 10);
    mismatch = (int) strtol(argv[2], NULL, 10);
    int gap_penalty = (int) strtol(argv[3], NULL, 10);

    const char *seq_1 = argv[4];
    const char *seq_2 = argv[5];

    size_t len_1 = strnlen(seq_1, MAX_STR_LEN);
    size_t len_2 = strnlen(seq_2, MAX_STR_LEN);

    int **F = NULL;
    char *o1 = NULL;
    char *o2 = NULL;
    char *om = NULL;
    size_t len;
    int score;

    sw_generate(&F,
                seq_1, seq_2, len_1, len_2,
                comparator, gap_penalty);
    sw_backtrack(&o1, &o2, &om, &len, &score,
                 F,
                 seq_1, seq_2, len_1, len_2,
                 comparator, gap_penalty);

    printf("%d\n", score);
    printf("%s\n", o1);
    if (argc == 7)
        printf("%s\n", om);
    printf("%s\n", o2);

    free_matrix(F, len_1 + 1, 0);
    free_string(o1, 0);
    free_string(o2, 0);
    free_string(om, 0);

    return 0;
}
