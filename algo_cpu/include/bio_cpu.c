#include "bio_cpu.h"

extern score_t match, mismatch;

__attribute__((always_inline)) score_t default_comparator(char a, char b) { return (a == b) ? match : mismatch; }

score_t max(score_t a, score_t b) { return (a > b) ? a : b; }

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

void **new_matrix(size_t row, size_t col) {
    score_t (*F)[col] = calloc(1, sizeof(score_t[row][col]));
    if (F == NULL)
        exit(1);
    return (void **) F;
}

char *new_string(size_t len) {
    char *str = (char *) calloc(len, sizeof(char));
    if (str == NULL)
        exit(1);
    return str;
}

void **to_diagonal(void **F, size_t row, size_t col) {
    size_t n_row = row + col - 1;
    size_t n_col = ((row < col) ? row : col);

    void **diag = new_matrix(n_row, n_col);

    // Anti-diagonal access
    for (size_t i = 0; i < row; ++i) {
        for (size_t j = 0; j < col; ++j) {
            ((score_t (*)[n_col]) diag)[i + j][j] = ((score_t (*)[col]) F)[i][j];
        }
    }

    return diag;
}

void **from_diagonal(void ***F, void **diag, size_t row, size_t col) {
    size_t n_col = ((row < col) ? row : col);

    // Anti-diagonal access
    for (size_t i = 0; i < row; ++i) {
        for (size_t j = 0; j < col; ++j) {
            ((score_t (*)[col]) (*F))[i][j] = ((score_t (*)[n_col]) diag)[i + j][j];
        }
    }

    return *F;
}

void nw_generate(void ***F,
                 const char *seq_a, const char *seq_b,
                 size_t len_a, size_t len_b,
                 score_t gap_penalty) {

    size_t len_a_new = len_a + 1;
    size_t len_b_new = len_b + 1;

    *F = new_matrix(len_a_new, len_b_new);

#ifndef _OPENMP
    score_t (*pF)[len_b_new] = (score_t (*)[len_b_new]) (*F);

    for (size_t i = 1; i < len_a_new; ++i)
        pF[i][0] = gap_penalty * (score_t) i;

    for (size_t j = 1; j < len_b_new; ++j)
        pF[0][j] = gap_penalty * (score_t) j;

    for (size_t i = 1; i < len_a_new; ++i) {
        for (size_t j = 1; j < len_b_new; ++j) {
            score_t _match = pF[i - 1][j - 1] +
                             default_comparator(seq_a[i - 1], seq_b[j - 1]);
            score_t _delete = pF[i - 1][j] + gap_penalty;
            score_t _insert = pF[i][j - 1] + gap_penalty;
            pF[i][j] = max(_match, max(_delete, _insert));
        }
    }
#else
    size_t row_diag = len_a_new + len_b_new - 1;
    size_t col_diag = len_a_new < len_b_new ? len_a_new : len_b_new;
    void **diag = new_matrix(row_diag, col_diag);
    score_t (*p_diag)[col_diag] = (score_t (*)[col_diag]) diag;

#pragma omp parallel default(none) \
    shared(p_diag, gap_penalty, len_a_new, len_b_new, row_diag, col_diag, seq_a, seq_b)
    {

        // Initialize
#pragma omp for simd nowait schedule(static)
        for (size_t i = 1; i < len_a_new; ++i)
            p_diag[i][0] = gap_penalty * (score_t) i;

        // Initialize
#pragma omp for simd nowait schedule(static)
        for (size_t j = 1; j < len_b_new; ++j)
            p_diag[j][j] = gap_penalty * (score_t) j;

        // Wavefront diagonal
        for (size_t i = 2; i < row_diag; ++i) {
            size_t max_j = (i < col_diag) ? i : col_diag;
#pragma omp for simd schedule(guided)
            for (size_t j = 1; j < max_j; ++j) {
                score_t _match = p_diag[i - 2][j - 1] +
                             default_comparator(seq_a[i - j - 1], seq_b[j - 1]);
                score_t _delete = p_diag[i - 1][j] + gap_penalty;
                score_t _insert = p_diag[i - 1][j - 1] + gap_penalty;
                p_diag[i][j] = max(_match, max(_delete, _insert));
            }
        }
    }

    from_diagonal(F, diag, len_a_new, len_b_new);
    free(diag);

#endif
}

void nw_backtrack(char **out_a, char **out_b, char **out_match,
                  size_t *aligned_len, score_t *score,
                  void **F,
                  const char *seq_a, const char *seq_b,
                  size_t len_a, size_t len_b,
                  score_t gap_penalty) {

    score_t (*pF)[len_b + 1] = (score_t (*)[len_b + 1]) F;
    size_t max_len = len_a + len_b;
    *score = 0;

    char *tmp_a = new_string(max_len);
    char *tmp_b = new_string(max_len);

    size_t i = len_a;
    size_t j = len_b;
    size_t idx = 0;

    while (i > 0 && j > 0) {
        score_t ms = default_comparator(seq_a[i - 1], seq_b[j - 1]);
        if (pF[i][j] == pF[i][j - 1] + gap_penalty) {
            tmp_a[idx] = '-';
            tmp_b[idx] = seq_b[j - 1];
            *score += gap_penalty;
            --j;
        } else if (pF[i][j] == pF[i - 1][j] + gap_penalty) {
            tmp_a[idx] = seq_a[i - 1];
            tmp_b[idx] = '-';
            *score += gap_penalty;
            --i;
        } else if (pF[i][j] == pF[i - 1][j - 1] + ms) {
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

    *out_a = new_string(idx);
    *out_b = new_string(idx);
    *out_match = new_string(idx);

#pragma omp parallel for schedule(static) default(none) shared(idx, out_a, tmp_a, out_b, tmp_b, out_match)
    for (size_t k = 0; k < idx; ++k) {
        (*out_a)[k] = tmp_a[idx - k - 1];
        (*out_b)[k] = tmp_b[idx - k - 1];
        (*out_match)[k] = ((*out_a)[k] == (*out_b)[k]) ? '|' : ' ';
    }

    *aligned_len = idx;

    free(tmp_a);
    free(tmp_b);
}

void sw_generate(void ***F,
                 const char *seq_a, const char *seq_b,
                 size_t len_a, size_t len_b,
                 score_t gap_penalty) {

    *F = new_matrix(len_a + 1, len_b + 1);
    score_t (*pF)[len_b] = (score_t (*)[len_b]) (*F);

    for (size_t i = 0; i < len_a + 1; ++i)
        (pF)[i][0] = 0;

    for (size_t j = 0; j < len_b + 1; ++j)
        (pF)[0][j] = 0;

    for (size_t i = 1; i < len_a + 1; ++i) {
        for (size_t j = 1; j < len_b + 1; ++j) {
            score_t _match = (pF)[i - 1][j - 1] + default_comparator(seq_a[i - 1], seq_b[j - 1]);
            score_t _delete = (pF)[i - 1][j] + gap_penalty;
            score_t _insert = (pF)[i][j - 1] + gap_penalty;
            (pF)[i][j] = max(0, max(_match, max(_delete, _insert)));
        }
    }
}

void sw_backtrack(char **out_a, char **out_b, char **out_match,
                  size_t *aligned_len, score_t *score,
                  void **F,
                  const char *seq_a, const char *seq_b,
                  size_t len_a, size_t len_b,
                  score_t gap_penalty) {

    score_t (*pF)[len_b] = (score_t (*)[len_b]) F;
    size_t max_len = len_a + len_b;

    char *tmp_a = new_string(max_len);
    char *tmp_b = new_string(max_len);

    size_t max_i = 0, max_j = 0;
    score_t max_score = pF[0][0];

    for (size_t i = 0; i <= len_a; i++) {
        for (size_t j = 0; j <= len_b; j++) {
            if (pF[i][j] > max_score) {
                max_score = pF[i][j];
                max_i = i;
                max_j = j;
            }
        }
    }
    size_t i = max_i;
    size_t j = max_j;

    size_t idx = 0;

    score_t ms;
    while (i > 0 && j > 0 && pF[i][j] != 0) {
        ms = default_comparator(seq_a[i - 1], seq_b[j - 1]);
        if (pF[i][j] == pF[i][j - 1] + gap_penalty) {
            tmp_a[idx] = '-';
            tmp_b[idx] = seq_b[j - 1];
            --j;
        } else if (pF[i][j] == pF[i - 1][j] + gap_penalty) {
            tmp_a[idx] = seq_a[i - 1];
            tmp_b[idx] = '-';
            --i;
        } else if (pF[i][j] == pF[i - 1][j - 1] + ms) {
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

    *out_a = new_string(idx);
    *out_b = new_string(idx);
    *out_match = new_string(idx);

    for (size_t k = 0; k < idx; ++k) {
        (*out_a)[k] = tmp_a[idx - k - 1];
        (*out_b)[k] = tmp_b[idx - k - 1];
        (*out_match)[k] = ((*out_a)[k] == (*out_b)[k]) ? '|' : ' ';
    }

    *aligned_len = idx;

    free(tmp_a);
    free(tmp_b);

    *score = max_score;
}
