#include "bio_cpu_openmp.h"

score_t default_comparator(char a, char b) { return (a == b) ? 1 : -1; }

int max(int a, int b) { return (a > b) ? a : b; }

int find_max(size_t argc, ...) {
    int max, current;

    va_list args;
    va_start(args, argc);

    max = va_arg(args, int);

    for (size_t i = 1; i < argc; ++i) {
        current = va_arg(args, int);
        if (current > max)
            max = current;
    }

    va_end(args);
    return max;
}

score_t ** new_matrix(size_t row, size_t col) {
    int **F;
    F = (int **) malloc(row * sizeof(int *));
    if (F == NULL)
        exit(1);

    for (size_t i = 0; i < row; ++i) {
        F[i] = (int *) calloc(col, sizeof(int));
        if (F[i] == NULL) {
            for (size_t j = 0; j < i; ++j)
                free(F[j]);
            free(F);
            exit(1);
        }
    }

    return F;
}

void free_matrix(score_t **F, size_t len_a, __attribute__((unused)) size_t len_b) {
    for (size_t i = 0; i < len_a; ++i)
        free(F[i]);
    free(F);
}

char *new_string(size_t len) {
    char *str;
    str = (char *) calloc(len, sizeof(char));
    if (str == NULL)
        exit(1);

    return str;
}

void free_string(char *str, __attribute__((unused)) size_t len) {
    free(str);
}

void nw_generate(int ***F,
                 const char *seq_a, const char *seq_b,
                 size_t len_a, size_t len_b,
                 score_func_t score_func, int gap_penalty) {

    *F = malloc_matrix(len_a + 1, len_b + 1);

#pragma omp parallel for
    for (size_t i = 0; i < len_a + 1; ++i)
        (*F)[i][0] = gap_penalty * (int) i;

#pragma omp parallel for
    for (size_t j = 0; j < len_b + 1; ++j)
        (*F)[0][j] = gap_penalty * (int) j;

    for (size_t slice = 2; slice < (len_a + len_b + 1); ++slice) {
        size_t z = (slice < len_a + 1) ? 0 : slice - len_a;
        size_t limit = slice - z;
        if (limit > len_b) { limit = len_b; }

#pragma omp parallel for
        for (size_t j = z; j <= limit; ++j) {
            size_t i = slice - j;
            if (i > 0 && j > 0 && i <= len_a && j <= len_b) {
                int _match = (*F)[i - 1][j - 1] + score_func(seq_a[i - 1], seq_b[j - 1]);
                int _delete = (*F)[i - 1][j] + gap_penalty;
                int _insert = (*F)[i][j - 1] + gap_penalty;
                (*F)[i][j] = max(_match, max(_delete, _insert));
            }
        }
    }
}

void nw_backtrack(char **out_a, char **out_b, char **out_match,
                  size_t *aligned_len, int *score,
                  int **F,
                  const char *seq_a, const char *seq_b,
                  size_t len_a, size_t len_b,
                  score_func_t score_func, int gap_penalty) {

    size_t max_len = len_a + len_b;
    *score = 0;

    char *tmp_a = malloc_string(max_len);
    char *tmp_b = malloc_string(max_len);

    size_t i = len_a;
    size_t j = len_b;
    size_t idx = 0;

    int ms;
    while (i > 0 && j > 0) {
        ms = score_func(seq_a[i - 1], seq_b[j - 1]);
        if (F[i][j] == F[i][j - 1] + gap_penalty) {
            tmp_a[idx] = '-';
            tmp_b[idx] = seq_b[j - 1];
            *score += gap_penalty;
            --j;
        } else if (F[i][j] == F[i - 1][j] + gap_penalty) {
            tmp_a[idx] = seq_a[i - 1];
            tmp_b[idx] = '-';
            *score += gap_penalty;
            --i;
        } else if (F[i][j] == F[i - 1][j - 1] + ms) {
            tmp_a[idx] = seq_a[i - 1];
            tmp_b[idx] = seq_b[j - 1];
            *score += ms;
            --i;
            --j;
        }
        ++idx;
    }

    while (j > 0) {
        tmp_a[idx] = '-';
        tmp_b[idx] = seq_b[j - 1];
        *score += gap_penalty;
        --j;
        ++idx;
    }

    while (i > 0) {
        tmp_a[idx] = seq_a[i - 1];
        tmp_b[idx] = '-';
        *score += gap_penalty;
        --i;
        ++idx;
    }

    *out_a = malloc_string(idx);
    *out_b = malloc_string(idx);
    *out_match = malloc_string(idx);

    for (size_t k = 0; k < idx; ++k) {
        (*out_a)[k] = tmp_a[idx - k - 1];
        (*out_b)[k] = tmp_b[idx - k - 1];
        (*out_match)[k] = ((*out_a)[k] == (*out_b)[k]) ? '|' : ' ';
    }

    *aligned_len = idx;

    free_string(tmp_a, 0);
    free_string(tmp_b, 0);
}

void sw_generate(int ***F,
                 const char *seq_a, const char *seq_b,
                 size_t len_a, size_t len_b,
                 score_func_t score_func, int gap_penalty) {

    *F = malloc_matrix(len_a + 1, len_b + 1);

    for (size_t i = 0; i < len_a + 1; ++i)
        (*F)[i][0] = 0;

    for (size_t j = 0; j < len_b + 1; ++j)
        (*F)[0][j] = 0;

    for (size_t i = 1; i < len_a + 1; ++i) {
        for (size_t j = 1; j < len_b + 1; ++j) {
            int _match = (*F)[i - 1][j - 1] + score_func(seq_a[i - 1], seq_b[j - 1]);
            int _delete = (*F)[i - 1][j] + gap_penalty;
            int _insert = (*F)[i][j - 1] + gap_penalty;
            (*F)[i][j] = max(0, max(_match, max(_delete, _insert)));
        }
    }
}

void sw_backtrack(char **out_a, char **out_b, char **out_match,
                  size_t *aligned_len, int *score,
                  int **F,
                  const char *seq_a, const char *seq_b,
                  size_t len_a, size_t len_b,
                  score_func_t score_func, int gap_penalty) {

    size_t max_len = len_a + len_b;

    char *tmp_a = malloc_string(max_len);
    char *tmp_b = malloc_string(max_len);

    size_t max_i = 0, max_j = 0;
    int max_score = F[0][0];

    for (size_t i = 0; i <= len_a; i++) {
        for (size_t j = 0; j <= len_b; j++) {
            if (F[i][j] > max_score) {
                max_score = F[i][j];
                max_i = i;
                max_j = j;
            }
        }
    }
    size_t i = max_i;
    size_t j = max_j;

    size_t idx = 0;

    int ms;
    while (i > 0 && j > 0 && F[i][j] != 0) {
        ms = score_func(seq_a[i - 1], seq_b[j - 1]);
        if (F[i][j] == F[i][j - 1] + gap_penalty) {
            tmp_a[idx] = '-';
            tmp_b[idx] = seq_b[j - 1];
            --j;
        } else if (F[i][j] == F[i - 1][j] + gap_penalty) {
            tmp_a[idx] = seq_a[i - 1];
            tmp_b[idx] = '-';
            --i;
        } else if (F[i][j] == F[i - 1][j - 1] + ms) {
            tmp_a[idx] = seq_a[i - 1];
            tmp_b[idx] = seq_b[j - 1];
            --i;
            --j;
        }
        ++idx;
    }

    while (j > 0) {
        tmp_a[idx] = '-';
        tmp_b[idx] = seq_b[j - 1];
        --j;
        ++idx;
    }

    while (i > 0) {
        tmp_a[idx] = seq_a[i - 1];
        tmp_b[idx] = '-';
        --i;
        ++idx;
    }

    *out_a = malloc_string(idx);
    *out_b = malloc_string(idx);
    *out_match = malloc_string(idx);

    for (size_t k = 0; k < idx; ++k) {
        (*out_a)[k] = tmp_a[idx - k - 1];
        (*out_b)[k] = tmp_b[idx - k - 1];
        (*out_match)[k] = ((*out_a)[k] == (*out_b)[k]) ? '|' : ' ';
    }

    *aligned_len = idx;

    free_string(tmp_a, 0);
    free_string(tmp_b, 0);

    *score = max_score;
}
