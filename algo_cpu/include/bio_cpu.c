#include "bio_cpu.h"

extern score_t match, mismatch, gap_penalty;
extern sequence_t seq_a, seq_b;
extern void **F;

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
    score_t (*mat)[col] = calloc(1, sizeof(score_t[row][col]));
    if (mat == NULL)
        exit(1);
    return (void **) mat;
}

char *new_string(size_t len) {
    char *str = (char *) calloc(len + 1, sizeof(char));
    if (str == NULL)
        exit(1);
    return str;
}

void **to_diagonal(void **F, size_t row, size_t col) {
    size_t n_row = row + col - 1;
    size_t n_col = ((row < col) ? row : col);

    void **diag = new_matrix(n_row, n_col);

    // Anti-diagonal access and parallelize (comb) when possible
#ifdef _OPENMP
#pragma omp parallel for collapse(2) default(none) shared(row, col, n_col, F, diag)
#endif
    for (size_t i = 0; i < row; ++i) {
        for (size_t j = 0; j < col; ++j) {
            ((score_t (*)[n_col]) diag)[i + j][j] = ((score_t (*)[col]) F)[i][j];
        }
    }

    return diag;
}

void **from_diagonal(void ***F, void **diag, size_t row, size_t col) {
    size_t n_col = ((row < col) ? row : col);

    // Anti-diagonal access and parallelize (comb) when possible
#ifdef _OPENMP
#pragma omp parallel for collapse(2) default(none) shared(row, col, n_col, F, diag)
#endif
    for (size_t i = 0; i < row; ++i) {
        for (size_t j = 0; j < col; ++j) {
            ((score_t (*)[col]) (*F))[i][j] = ((score_t (*)[n_col]) diag)[i + j][j];
        }
    }

    return *F;
}

void nw_generate() {
    impl_nw_generate_1();
}

void impl_nw_generate_1() {

    size_t len_a_new = seq_a.len + 1;
    size_t len_b_new = seq_b.len + 1;
    F = new_matrix(len_a_new, len_b_new);
    score_t (*pF)[len_b_new] = (score_t (*)[len_b_new]) F;

#ifdef _OPENMP
#pragma omp parallel default(none) shared(pF, gap_penalty, len_a_new, len_b_new)
    {
#endif

        // Initialize
#ifdef _OPENMP
#pragma omp for nowait schedule(static)
#endif
        for (size_t i = 1; i < len_a_new; ++i)
            pF[i][0] = gap_penalty * (score_t) i;

        // Initialize
#ifdef _OPENMP
#pragma omp for nowait schedule(static)
#endif
        for (size_t j = 1; j < len_b_new; ++j)
            pF[0][j] = gap_penalty * (score_t) j;

#ifdef _OPENMP
    }
#endif

    // Block calculation starts at i=1, j=1.
    size_t i_begin = 1;
    size_t j_begin = 1;
    block_t init_block = {&F, len_a_new, len_b_new,
                          i_begin, j_begin,
                          len_a_new, len_b_new};

    impl_nw_generate_1_block_recur(&init_block, 1);
}

void impl_nw_generate_1_block_iter(block_t *block,
                                   int split_block) {
    size_t hx = block->i_end - block->i_begin;
    size_t wx = block->j_end - block->j_begin;
    size_t count_i = CEIL_DIV(hx, MAX_BLOCK_WIDTH);
    size_t count_j = CEIL_DIV(wx, MAX_BLOCK_WIDTH);

    for (size_t i = 0; i < (count_i + count_j - 1); ++i) {
        size_t j_start = i < count_j ? 0 : i - count_j + 1;
        size_t j_end = i < count_i ? i + 1 : count_i;

        for (size_t j = j_start; j < j_end; ++j) {
            size_t diag_i = j;
            size_t diag_j = i - j;

            // todo: NW algo inside a small block (N^2)
        }
    }
}

void impl_nw_generate_1_block_recur(block_t *block,
                                    int split_block) {
    size_t hx = block->i_end - block->i_begin;
    size_t wx = block->j_end - block->j_begin;

    if (split_block && hx * wx >= MAX_BLOCK_SIZE) {
        size_t new_hx = hx / 2;
        size_t new_wx = wx / 2;

        // partitioning blocks 0-3: top-left, top-right, bottom-left, bottom-right
        block_t b = {0};

        b.ptr = block->ptr;
        b.full_w = block->full_w;
        b.full_h = block->full_h;

        // block 0
        b.i_begin = block->i_begin;
        b.j_begin = block->j_begin;
        b.i_end = block->i_begin + new_hx;
        b.j_end = block->j_begin + new_wx;
        impl_nw_generate_1_block_recur(&b, 1);

#pragma omp parallel sections default(none) shared(block, new_hx, new_wx)
        {
#pragma omp section
            {
                // block 1
                block_t b1 = {
                        block->ptr,
                        block->full_h,
                        block->full_w,
                        block->i_begin,
                        block->j_begin + new_wx,
                        block->i_begin + new_hx,
                        block->j_end
                };
                impl_nw_generate_1_block_recur(&b1, 1);
            }
#pragma omp section
            {
                // block 2
                block_t b2 = {
                        block->ptr,
                        block->full_h,
                        block->full_w,
                        block->i_begin + new_hx,
                        block->j_begin,
                        block->i_end,
                        block->j_begin + new_wx
                };
                impl_nw_generate_1_block_recur(&b2, 1);
            }
        }

        // block 3
        b.i_begin = block->i_begin + new_hx;
        b.j_begin = block->j_begin + new_wx;
        b.i_end = block->i_end;
        b.j_end = block->j_end;
        impl_nw_generate_1_block_recur(&b, 1);

    } else {
        score_t (*pF)[block->full_w] = (score_t (*)[block->full_w]) (*(block->ptr));

#ifndef DIAGONAL_ARRAY_ACCESS
        for (size_t i = block->i_begin; i < block->i_end; ++i) {
            for (size_t j = block->j_begin; j < block->j_end; ++j) {
                score_t _match = pF[i - 1][j - 1] +
                                 default_comparator(seq_a.data[i - 1], seq_b.data[j - 1]);
                score_t _delete = pF[i - 1][j] + gap_penalty;
                score_t _insert = pF[i][j - 1] + gap_penalty;
                pF[i][j] = max(_match, max(_delete, _insert));
            }
        }
#else
        for (size_t i = 0; i < (hx + wx - 1); ++i) {
            size_t j_start = i < wx ? 0 : i - wx + 1;
            size_t j_end = i < hx ? i + 1 : hx;

            for (size_t j = j_start; j < j_end; ++j) {
                size_t diag_i = block->i_begin + (j);
                size_t diag_j = block->j_begin + (i - j);

                score_t _match = (pF)[diag_i - 1][diag_j - 1] +
                                 default_comparator(seq_a.data[diag_i - 1], seq_b.data[diag_j - 1]);
                score_t _delete = (pF)[diag_i - 1][diag_j] + gap_penalty;
                score_t _insert = (pF)[diag_i][diag_j - 1] + gap_penalty;
                (pF)[diag_i][diag_j] = max(_match, max(_delete, _insert));
            }
        }
#endif
    }
}

void nw_backtrack(char **out_a, char **out_b, char **out_match,
                  size_t *aligned_len, score_t *score) {

    score_t (*pF)[seq_b.len + 1] = (score_t (*)[seq_b.len + 1]) F;
    size_t max_len = seq_a.len + seq_b.len;
    *score = 0;

    char *tmp_a = new_string(max_len);
    char *tmp_b = new_string(max_len);

    size_t i = seq_a.len;
    size_t j = seq_b.len;
    size_t idx = 0;

    while (i > 0 && j > 0) {
        score_t ms = default_comparator(seq_a.data[i - 1], seq_b.data[j - 1]);
        if (pF[i][j] == pF[i][j - 1] + gap_penalty) {
            tmp_a[idx] = '-';
            tmp_b[idx] = seq_b.data[j - 1];
            *score += gap_penalty;
            --j;
        } else if (pF[i][j] == pF[i - 1][j] + gap_penalty) {
            tmp_a[idx] = seq_a.data[i - 1];
            tmp_b[idx] = '-';
            *score += gap_penalty;
            --i;
        } else if (pF[i][j] == pF[i - 1][j - 1] + ms) {
            tmp_a[idx] = seq_a.data[i - 1];
            tmp_b[idx] = seq_b.data[j - 1];
            *score += ms;
            --i;
            --j;
        }
        ++idx;
    }

    while (j > 0) {
        tmp_a[idx] = '-';
        tmp_b[idx] = seq_b.data[j - 1];
        *score += gap_penalty;
        --j;
        ++idx;
    }

    while (i > 0) {
        tmp_a[idx] = seq_a.data[i - 1];
        tmp_b[idx] = '-';
        *score += gap_penalty;
        --i;
        ++idx;
    }

    *out_a = new_string(idx);
    *out_b = new_string(idx);
    *out_match = new_string(idx);

#pragma omp parallel for simd schedule(static) default(none) shared(idx, out_a, tmp_a, out_b, tmp_b, out_match)
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
