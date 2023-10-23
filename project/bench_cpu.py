from program.fasta_parser import fasta_iter
import os
import sys
import time

PROGRAM_PATHS = [f'exec/uut{i}' for i in range(1, 5 + 1)]
SEQUENCE1_PATH = 'seq/set6'
SEQUENCE2_PATH = 'seq/set5'

SEP = "\"*\""
SCORE_MATCH, SCORE_MISMATCH, GAP_PENALTY = 3.621354295, -2.451795405, -1.832482334
PARAMS_FIXED = f'{SCORE_MATCH} {SCORE_MISMATCH} {GAP_PENALTY}'

RUNS_PER_TEST = 1
OUTPUT_FILENAME = 'out/test'

if __name__ == '__main__':
    if RUNS_PER_TEST < 1:
        raise Exception('Runs must be at least 1')

    for prog_path in PROGRAM_PATHS:
        with open(f'{OUTPUT_FILENAME}_{prog_path[prog_path.rfind("/") + 1:]}.tsv', mode='w', encoding='utf-8') as f:
            for fn1, fn2 in zip(sorted(os.listdir(SEQUENCE1_PATH), key=lambda x: (len(x), x)),
                                sorted(os.listdir(SEQUENCE2_PATH), key=lambda x: (len(x), x))):
                for f1, f2 in zip(fasta_iter(os.path.join(SEQUENCE1_PATH, fn1)),
                                  fasta_iter(os.path.join(SEQUENCE2_PATH, fn2))):
                    try:
                        seq1_name, seq1_data = f1.name, f1.seq
                        seq2_name, seq2_data = f2.name, f2.seq

                        cum_time = 0

                        for i in range(RUNS_PER_TEST):
                            # output = "/dev/null"
                            output = f'./exec/output/result_{prog_path[prog_path.rfind("/") + 1:]}_{len(f1)}.txt'
                            cmd = f'./{prog_path} {PARAMS_FIXED} {seq1_data} {seq2_data} {SEP} >> {output}'

                            ##################################################################
                            start = time.time()
                            os.system(cmd)
                            end = time.time()
                            ##################################################################

                            cum_time += (end - start) * 1_000

                        s = f'{prog_path}\t{len(f1)}\t{cum_time / RUNS_PER_TEST}\n'
                        sys.stdout.write(s)
                        sys.stdout.flush()
                        f.write(s)
                        f.flush()
                    except KeyboardInterrupt:
                        print('Terminated')
