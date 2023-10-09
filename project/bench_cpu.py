from program.fasta_parser import fasta_iter
import os
import sys

PROGRAM_PATH = 'exec/algo_cpu'
SEQUENCE1_PATH = 'seq/rand1.fasta'
SEQUENCE2_PATH = 'seq/rand2.fasta'

SCORE_MATCH, SCORE_MISMATCH, GAP_PENALTY = 1, -1, -2


if __name__ == '__main__':
    for f1, f2 in zip(fasta_iter(SEQUENCE1_PATH), fasta_iter(SEQUENCE2_PATH)):
        seq1_name, seq1_data = f1
        seq2_name, seq2_data = f2
        sys.stdout.write(f'{seq1_name} <-> {seq2_name}\n')
        os.system(f'time {PROGRAM_PATH} {SCORE_MATCH} {SCORE_MISMATCH} {GAP_PENALTY} {seq1_data} {seq2_data} 1')
