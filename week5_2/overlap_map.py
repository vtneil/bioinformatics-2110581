from program.seq_assembler import *


def main1():
    rs = []

    with open('a3/microbiome_reads_1.txt') as f:
        r1 = [line.strip() for line in f.readlines() if line]
        rs.extend(r1)

    with open('a3/microbiome_reads_2.txt') as f:
        r2 = [line.strip() for line in f.readlines() if line]
        rs.extend(r2)

    assembled_seqs = sequence_assembly(rs, 8)
    for e in assembled_seqs:
        print(e)


def main2():
    rs = []

    with open('a3/microbiome_reads_1.txt') as f:
        r1 = [line.strip() for line in f.readlines() if line]
        rs.extend(r1)

    with open('a3/microbiome_reads_2.txt') as f:
        r2 = [line.strip() for line in f.readlines() if line]
        rs.extend(r2)
        
    with open('a3/out') as f:
        seqs = [line.strip() for line in f.readlines() if line]
    seq_cnt = [0] * len(seqs)
    
    for r in rs:
        for i, seq in enumerate(seqs):
            if r in seq:
                seq_cnt[i] += 1
    
    print(seq_cnt)


if __name__ == '__main__':
    main2()
