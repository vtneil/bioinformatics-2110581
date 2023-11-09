from Greedy import greedy_motif_search
from BruteForce import BruteForceMotifSearch
from Random import RandomMotifSearch
from program.fasta_parser import *


def main():
    seq_iter = fasta_iter('../samples.fasta')
    DNA = list(map(lower_seq, seq_iter))
    seq_iter = fasta_iter('../samples.fasta')

    k = 10

    # with open('Greedy.txt', 'w') as plik:
    #     Score1, S1 = GreedyMotifSearch(DNA, k, len(DNA))
    #     print(str(k) + '-mery', 'Score wynosi: ' + str(Score1), 'Motyw:', file=plik)
    #     print(str(k) + '-mery', 'Score wynosi: ' + str(Score1), 'Motyw:')
    # with open('Greedy.txt', 'a') as plik:
    #     for i, seq in enumerate(DNA):
    #         print(seq[S1[i]:S1[i] + k], file=plik)
    #         print(seq[S1[i]:S1[i] + k])
    #
    # print()

    Score2, S2 = greedy_motif_search(DNA, k, len(DNA))
    print(str(k) + '-mer', 'Score: ' + str(Score2), 'Motif:')

    with open(f'out/greedy_out_{99}.txt', mode='w') as plik:
        for i, seq in enumerate(DNA):
            print(seq[S2[i]:S2[i] + k], file=plik)
            print(seq[S2[i]:S2[i] + k])

    out_list = []

    with open(f'out/greedy_out_repl_{99}.txt', mode='w') as f:
        for motif_idx, seq in zip(S2, DNA):
            s = f'{seq[0:motif_idx]}{seq[motif_idx:motif_idx + k].upper()}{seq[motif_idx + k:]}'
            out_list.append(s)
            print(s, file=f)

    with open(f'out/samples_out.fasta', mode='w') as f:
        for new_seq, old_seq in zip(out_list, seq_iter):
            print(f'>{old_seq.name}', file=f)
            print(f'{new_seq}', file=f)

    print(S2)
    print(out_list)


if __name__ == '__main__':
    main()
