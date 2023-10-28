from program.fasta_parser import fasta_iter
import os
import sys
import time

PROGRAM_PATHS = ['exec/nw-sequential', 'exec/nw-parallel-block']
SEQUENCE1_PATH = 'seq/set7'
SEQUENCE2_PATH = 'seq/set8'

SEP = "\"*\""
SCORE_MATCH, SCORE_MISMATCH, GAP_PENALTY = 3.621354295, -2.451795405, -1.832482334
PARAMS_FIXED = f'{SCORE_MATCH} {SCORE_MISMATCH} {GAP_PENALTY}'

RUNS_PER_TEST = 1
OUTPUT_FILENAME = 'out/test'

# todo Benchmark new set7 and set8 for sequential and block parallel
# todo including memory limit

if __name__ == '__main__':
    if RUNS_PER_TEST < 1:
        raise Exception('Runs must be at least 1')

    for prog_path in PROGRAM_PATHS:
        with open(f'{OUTPUT_FILENAME}_{prog_path[prog_path.rfind("/") + 1:]}.tsv', mode='w', encoding='utf-8') as f:
            for fn1, fn2 in zip(sorted(os.listdir(SEQUENCE1_PATH), key=lambda x: (len(x), x)),
                                sorted(os.listdir(SEQUENCE2_PATH), key=lambda x: (len(x), x))):
                try:
                    seq1_name, seq1_data = fn1, os.path.abspath(os.path.join(SEQUENCE1_PATH, fn1))
                    seq2_name, seq2_data = fn2, os.path.abspath(os.path.join(SEQUENCE2_PATH, fn2))

                    cum_time = 0

                    for i in range(RUNS_PER_TEST):
                        output = "/dev/null"
                        cmd = f'./{prog_path} {PARAMS_FIXED} {seq1_data} {seq2_data} {SEP} >> {output}'

                        sys.stdout.write(f'Executing {prog_path}...\n')
                        sys.stdout.flush()

                        ##################################################################
                        start = time.time()
                        os.system(cmd)
                        end = time.time()
                        ##################################################################

                        cum_time += (end - start) * 1_000

                    s = f'{prog_path}\t{fn1[fn1.rfind("_") + 1:fn1.rfind(".")]}\t{cum_time / RUNS_PER_TEST}\n'
                    sys.stdout.write(s)
                    sys.stdout.flush()
                    f.write(s)
                    f.flush()
                except KeyboardInterrupt:
                    print('Terminated')
