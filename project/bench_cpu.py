from program.fasta_parser import fasta_iter
import os
import sys
import time

PROGRAM_PATHS = ['exec/algo-nw', 'exec/algo-nw-openmp-gui']
PROGRAM_PATHS.extend(['exec/algo-nw-openmp-dyn', 'exec/algo-nw-openmp-sta'])
SEQUENCE1_PATH = 'seq/set1'
SEQUENCE2_PATH = 'seq/set2'

SCORE_MATCH, SCORE_MISMATCH, GAP_PENALTY = -1.832482334, 3.621354295, 2.451795405
PARAMS_FIXED = f'{SCORE_MATCH} {SCORE_MISMATCH} {GAP_PENALTY}'

OUTPUT_FILENAME = 'out/test'

if __name__ == '__main__':
    for prog_path in PROGRAM_PATHS:
        with open(f'{OUTPUT_FILENAME}_{prog_path[prog_path.rfind("/") + 1:]}.tsv', mode='w') as f:
            for fn1, fn2 in zip(sorted(os.listdir(SEQUENCE1_PATH), key=lambda x: (len(x), x)),
                                sorted(os.listdir(SEQUENCE2_PATH), key=lambda x: (len(x), x))):
                for f1, f2 in zip(fasta_iter(os.path.join(SEQUENCE1_PATH, fn1)),
                                  fasta_iter(os.path.join(SEQUENCE1_PATH, fn2))):
                    try:
                        seq1_name, seq1_data = f1.name, f1.seq
                        seq2_name, seq2_data = f2.name, f2.seq
                        # sys.stdout.write(f'{seq1_name} <-> {seq2_name}\n')

                        start = time.time()
                        os.system(
                            f'./{prog_path} {PARAMS_FIXED} {seq1_data} {seq2_data} >> /dev/null'
                        )
                        end = time.time()

                        time.sleep(0.010)

                        s = f'{prog_path}\t{len(f1)}\t{end - start}\n'
                        sys.stdout.write(s)
                        f.write(s)
                    except KeyboardInterrupt:
                        print('Terminated')
