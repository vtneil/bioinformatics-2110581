#ifndef ALGO_CPU_BIO_CPU_H
#define ALGO_CPU_BIO_CPU_H

#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

#ifdef _OPENMP
#include <omp.h>
#endif

#define DEFAULT_GAP_PENALTY (-2)

typedef double score_t;

typedef score_t (*score_func_t)(char, char);

__attribute__((always_inline)) extern score_t default_comparator(char a, char b);

extern score_t max(score_t a, score_t b);

extern int find_max(size_t argc, ...);

extern void **new_matrix(size_t row, size_t col);

extern char *new_string(size_t len);

void **to_diagonal(void **F, size_t row, size_t col);

void **from_diagonal(void ***F, void **diag, size_t row, size_t col);

extern void nw_generate(void ***F,
                        const char *seq_a, const char *seq_b,
                        size_t len_a, size_t len_b,
                        score_t gap_penalty);

extern void nw_backtrack(char **out_a, char **out_b, char **out_match,
                         size_t *aligned_len, score_t *score,
                         void **F,
                         const char *seq_a, const char *seq_b,
                         size_t len_a, size_t len_b,
                         score_t gap_penalty);

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
