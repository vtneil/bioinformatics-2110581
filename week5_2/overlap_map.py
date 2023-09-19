from Bio import Seq, SeqIO
from overlap import *


def main():
    rs = []

    with open('a2/microbiome_reads_1.txt') as f:
        r1 = [line.strip() for line in f.readlines() if line]
        rs.extend(r1)

    with open('a2/microbiome_reads_2.txt') as f:
        r2 = [line.strip() for line in f.readlines() if line]
        rs.extend(r2)
    
    for i, x in enumerate(rs):
        with open(f'a2/samples/sample1_{i}x', mode='w') as f:
            f.write(x)


if __name__ == '__main__':
    main()
