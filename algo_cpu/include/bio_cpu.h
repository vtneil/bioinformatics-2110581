#ifndef ALGO_CPU_BIO_CPU_H
#define ALGO_CPU_BIO_CPU_H

#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#ifdef _OPENMP

#include <omp.h>

#endif

#define DIV_MOD(T, Q, R, A, B)      T Q = (A) / (B); T R = (A) % (B);
#define MAX_BLOCK_WIDTH             64ULL  // to fit 64KB Cache with double
#define MAX_BLOCK_SIZE              (MAX_BLOCK_WIDTH * MAX_BLOCK_WIDTH)
//#define DIAGONAL_ARRAY_ACCESS

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
    char *data;
    size_t len;
} sequence_t;

#if defined(__GCC__)
__attribute__((always_inline))
#elif defined(_MSC_VER)
__forceinline
#endif
extern score_t default_comparator(char a, char b);

#ifndef max
extern score_t max(score_t a, score_t b);
#endif

extern int find_max(size_t argc, ...);

extern void **new_matrix(size_t row, size_t col);

extern char *new_string(size_t len);

extern void nw_generate(void);

extern void impl_nw_generate_1(void);

extern void impl_nw_generate_1_block_recur(block_t *block,
                                           int is_subdivide);

extern void impl_nw_generate_1_block_iter(block_t *block);

extern void nw_backtrack(char **out_a,
                         char **out_b,
                         char **out_match,
                         size_t *aligned_len,
                         score_t *score);

extern void sw_generate(void ***F,
                        const char *seq_a, const char *seq_b,
                        size_t len_a, size_t len_b,
                        score_t gap_penalty);

extern void sw_backtrack(char **out_a, char **out_b, char **out_match,
                         size_t *aligned_len, score_t *score,
                         void **F,
                         const char *seq_a, const char *seq_b,
                         size_t len_a, size_t len_b,
                         score_t gap_penalty);

#endif
