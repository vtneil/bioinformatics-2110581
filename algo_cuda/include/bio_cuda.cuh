#ifndef ALGO_CUDA_BIO_CUDA_CUH
#define ALGO_CUDA_BIO_CUDA_CUH

#include <cstdlib>
#include <cstring>
#include <cstdarg>

#define DIV_MOD(T, Q, R, A, B)      T Q = (A) / (B); T R = (A) % (B);
#define MAX_BLOCK_WIDTH             16384ULL
//#define MAX_BLOCK_WIDTH             5ULL  // Test
#define MAX_BLOCK_SIZE              (MAX_BLOCK_WIDTH * MAX_BLOCK_WIDTH)

typedef double score_t;

typedef struct {
    void ***ptr;
    size_t full_h;
    size_t full_w;
    size_t i_begin;
    size_t j_begin;
    size_t i_end;
    size_t j_end;
} block_t;

typedef struct {
    const char *data;
    size_t len;
} sequence_t;

extern char join_char;
extern score_t match, mismatch, gap_penalty;
extern sequence_t seq_a, seq_b;
extern void **F;

score_t default_comparator(char a, char b) { return (a == b) ? match : mismatch; }

void **new_matrix(size_t row, size_t col) {
    void **mat = (void **) calloc(1, sizeof(score_t[row][col]));
    if (mat == NULL)
        exit(1);
    return mat;
}

char *new_string(size_t len) {
    char *str = (char *) calloc(len + 1, sizeof(char));
    if (str == NULL)
        exit(1);
    return str;
}

extern "C" void impl_nw_generate_1_block_iter(block_t *block) {
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

extern "C" void impl_nw_generate_1(void) {

    size_t len_a_new = seq_a.len + 1;
    size_t len_b_new = seq_b.len + 1;
    F = new_matrix(len_a_new, len_b_new);
    score_t (*pF)[len_b_new] = (score_t (*)[len_b_new]) F;

    // Initialize
    for (size_t i = 1; i < len_a_new; ++i)
        pF[i][0] = gap_penalty * (score_t) i;

    // Initialize
    for (size_t j = 1; j < len_b_new; ++j)
        pF[0][j] = gap_penalty * (score_t) j;

    // Block calculation starts at i=0, j=0.
    size_t i_begin = 0;
    size_t j_begin = 0;
    block_t init_block = {&F, len_a_new, len_b_new,
                          i_begin, j_begin,
                          len_a_new, len_b_new};

    impl_nw_generate_1_block_iter(&init_block);
}

void nw_generate(void) {
    impl_nw_generate_1();
}

extern "C" void nw_backtrack(char **out_a,
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


    for (size_t k = 0; k < idx; ++k) (*out_a)[k] = tmp_a[idx - k - 1];
    for (size_t k = 0; k < idx; ++k) (*out_b)[k] = tmp_b[idx - k - 1];
    for (size_t k = 0; k < idx; ++k) (*out_match)[k] = ((*out_a)[k] == (*out_b)[k]) ? join_char : ' ';

    *aligned_len = idx;

    free(tmp_a);
    free(tmp_b);
}

#endif