from dataclasses import dataclass
from itertools import groupby


@dataclass
class FastaSequence:
    name: str = 'FASTA Sequence'
    seq: str = ''

    def __len__(self):
        return len(self.seq)


def fasta_iter(filename: str):
    _fasta_file = open(filename, mode='r', encoding='utf-8')
    _faster_iter = (x[1] for x in groupby(_fasta_file, lambda line: line[0] == '>'))
    for _header in _faster_iter:
        _header_str = _header.__next__()[1:].strip()
        _seq = ''.join(s.strip() for s in _faster_iter.__next__())
        yield FastaSequence(_header_str, _seq)


def str_block_iter(input_string: str, max_length=60):
    while len(input_string) > max_length:
        idx = max_length
        while idx > 0 and input_string[idx] != ' ':
            idx -= 1
        if idx == 0:
            idx = max_length

        yield input_string[:idx]
        input_string = input_string[idx:].strip()

    yield input_string


def upper_seq(fasta_sequence: FastaSequence):
    return fasta_sequence.seq.upper()


def lower_seq(fasta_sequence: FastaSequence):
    return fasta_sequence.seq.lower()
