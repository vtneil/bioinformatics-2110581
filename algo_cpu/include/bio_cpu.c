#include "bio_cpu.h"

extern char join_char;
extern score_t match, mismatch, gap_penalty;
extern sequence_t seq_a, seq_b;
extern void **F;

#if defined(__GCC__)
__attribute__((always_inline))
#elif defined(_MSC_VER)
__forceinline
#endif
score_t default_comparator(char a, char b) { return (a == b) ? match : mismatch; }

#ifndef max
score_t max(score_t a, score_t b) { return (a > b) ? a : b; }
#endif

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

void nw_generate(void) {
    impl_nw_generate_1();
}

void impl_nw_generate_1(void) {

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

    // Block calculation starts at i=0, j=0.
    size_t i_begin = 0;
    size_t j_begin = 0;
    block_t init_block = {&F, len_a_new, len_b_new,
                          i_begin, j_begin,
                          len_a_new, len_b_new};

    impl_nw_generate_1_block_recur(&init_block, 0);
//    impl_nw_generate_1_block_iter(&init_block);
}

void impl_nw_generate_1_block_iter(block_t *block) {
    size_t full_hx = block->i_end;
    size_t full_wx = block->j_end;

    DIV_MOD(size_t, full_i, rem_i,
            full_hx, MAX_BLOCK_WIDTH)
    DIV_MOD(size_t, full_j, rem_j,
            full_wx, MAX_BLOCK_WIDTH)

    size_t count_i = full_i + (rem_i != 0);
    size_t count_j = full_j + (rem_j != 0);

    size_t block_hx = full_hx < MAX_BLOCK_WIDTH ? full_hx : MAX_BLOCK_WIDTH;
    size_t block_wx = full_wx < MAX_BLOCK_WIDTH ? full_wx : MAX_BLOCK_WIDTH;

    score_t (*pF)[block->full_w] = (score_t (*)[block->full_w]) (*(block->ptr));

    // Access blocks in anti-diagonal pattern (for parallelism)
#ifdef _OPENMP
#pragma omp parallel default(none) \
    shared(count_i, count_j, rem_i, rem_j, block, block_hx, block_wx, pF, seq_a, seq_b, gap_penalty)
#endif
    for (size_t h_block_i = 0; h_block_i < (count_i + count_j - 1); ++h_block_i) {
        size_t j_start = h_block_i < count_j ? 0 : h_block_i - count_j + 1;
        size_t j_end = h_block_i < count_i ? h_block_i + 1 : count_i;

#ifdef _OPENMP
#pragma omp for schedule(static)
#endif
        for (size_t h_block_j = j_start; h_block_j < j_end; ++h_block_j) {
            size_t block_i = h_block_j;
            size_t block_j = h_block_i - h_block_j;

            size_t ii_start = block_i * block_hx;
            size_t jj_start = block_j * block_wx;
            size_t ii_stop = rem_i != 0 && block_i == count_i - 1 ?
                             block_i * block_hx + rem_i :
                             (block_i + 1) * block_hx;
            size_t jj_stop = rem_j != 0 && block_j == count_j - 1 ?
                             block_j * block_wx + rem_j :
                             (block_j + 1) * block_wx;

            // Access within the block in row sweeping pattern (better cache locality)
            for (size_t i = ii_start; i < ii_stop; ++i) {
                for (size_t j = jj_start; j < jj_stop; ++j) {
                    if (i == 0 || j == 0) continue;
                    score_t _match = pF[i - 1][j - 1] +
                                     default_comparator(seq_a.data[i - 1],
                                                        seq_b.data[j - 1]);
                    score_t _delete = pF[i - 1][j] + gap_penalty;
                    score_t _insert = pF[i][j - 1] + gap_penalty;
                    pF[i][j] = max(_match, max(_delete, _insert));
                }
            }
        }
    }
}

void impl_nw_generate_1_block_recur(block_t *block,
                                    int is_subdivide) {
    size_t hx = block->i_end - block->i_begin;
    size_t wx = block->j_end - block->j_begin;

    if (is_subdivide && hx * wx >= MAX_BLOCK_SIZE) {
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

#ifdef _OPENMP
#pragma omp parallel sections default(none) shared(block, new_hx, new_wx)
        {
#pragma omp section
            {
#endif
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
#ifdef _OPENMP
            }
#pragma omp section
            {
#endif
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
#ifdef _OPENMP
            }
        }
#endif

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
                if (i == 0 || j == 0) continue;
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

void nw_backtrack(char **out_a,
                  char **out_b,
                  char **out_match,
                  size_t *aligned_len,
                  score_t *score) {

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

#ifdef _OPENMP
#pragma omp parallel sections default(none) shared(out_a, out_b, out_match, tmp_a, tmp_b, idx, join_char)
    {
#pragma omp section
        for (size_t k = 0; k < idx; ++k) (*out_a)[k] = tmp_a[idx - k - 1];
#pragma omp section
        for (size_t k = 0; k < idx; ++k) (*out_b)[k] = tmp_b[idx - k - 1];
    }
    for (size_t k = 0; k < idx; ++k) (*out_match)[k] = ((*out_a)[k] == (*out_b)[k]) ? join_char : ' ';
#else
    for (size_t k = 0; k < idx; ++k) {
            (*out_a)[k] = tmp_a[idx - k - 1];
            (*out_b)[k] = tmp_b[idx - k - 1];
            (*out_match)[k] = ((*out_a)[k] == (*out_b)[k]) ? join_char : ' ';
    }
#endif

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
