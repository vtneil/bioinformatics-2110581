from Bio.Seq import *
from program.fasta_parser import *


FASTA_FILENAMES = ['src/cDNA1.fasta', 'src/cDNA2.fasta', 'src/example cDNA.fasta']


if __name__ == '__main__':
    seqs = [e for fasta_seq in FASTA_FILENAMES for e in fasta_iter(fasta_seq)]
    for seq in seqs:
        print(f'>{seq.name}')
        s = Seq(data=seq.seq)
        tr = s.translate().__str__()
        print('\n'.join(split_string(tr, max_length=60)))
