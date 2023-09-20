import itertools


def find_max_overlap(input_sequences, cache_str: dict = None):
    max_len = 0
    x, y = None, None
    result = ''

    for a, b in itertools.permutations(input_sequences, 2):
        for i in range(1, len(a)):
            if b.startswith(a[i:]):
                if len(a[i:]) > max_len:
                    max_len = len(a[i:])
                    x, y = a, b
                    result = a + b[max_len:]

    return x, y, result, max_len


def sequence_assembly(input_sequences, min_overlap: int = 1):
    output_assembled = set(input_sequences)
    _cache = dict()

    while True:
        a, b, merged, overlap_len = find_max_overlap(output_assembled, _cache)

        if overlap_len < min_overlap:
            break

        output_assembled.discard(a)
        output_assembled.discard(b)
        output_assembled.add(merged)

    return sorted(output_assembled, key=lambda x: (-len(x), x))


__all__ = ['find_max_overlap', 'sequence_assembly']

if __name__ == '__main__':
    q = find_max_overlap(['AAAACAACTAACCCTTGCCAA', 'AAACAACTAACCCTTGCCAAC'])
    print(q)
    sequences = ['abcd', 'efgh', 'fghi', 'cde', 'k1', 'k2', 'k3']
    assembled_seqs = sequence_assembly(sequences, 2)
    print(assembled_seqs)
