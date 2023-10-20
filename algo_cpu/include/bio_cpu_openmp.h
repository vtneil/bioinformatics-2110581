#ifndef ALGO_CPU_BIO_CPU_OPENMP_H
#define ALGO_CPU_BIO_CPU_OPENMP_H

#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include <omp.h>

#define DEFAULT_GAP_PENALTY (-2)

typedef int (*score_func_t)(char, char);

extern score_t default_comparator(char a, char b);

extern int max(int a, int b);

extern int find_max(size_t argc, ...);

extern score_t ** new_matrix(size_t row, size_t col);

extern void free_matrix(score_t **F, size_t len_a, __attribute__((unused)) size_t len_b);

extern char *new_string(size_t len);

extern void free_string(char *str, __attribute__((unused)) size_t len);

extern void nw_generate(int ***F,
                 const char *seq_a, const char *seq_b,
                 size_t len_a, size_t len_b,
                 score_func_t score_func, int gap_penalty);

extern void nw_backtrack(char **out_a, char **out_b, char **out_match,
                  size_t *aligned_len, int *score,
                  int **F,
                  const char *seq_a, const char *seq_b,
                  size_t len_a, size_t len_b,
                  score_func_t score_func, int gap_penalty);

extern void sw_generate(int ***F,
                 const char *seq_a, const char *seq_b,
                 size_t len_a, size_t len_b,
                 score_func_t score_func, int gap_penalty);

extern void sw_backtrack(char **out_a, char **out_b, char **out_match,
                  size_t *aligned_len, int *score,
                  int **F,
                  const char *seq_a, const char *seq_b,
                  size_t len_a, size_t len_b,
                  score_func_t score_func, int gap_penalty);

#endif //ALGO_CPU_BIO_CPU_OPENMP_H
