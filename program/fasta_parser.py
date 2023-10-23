from dataclasses import dataclass
from itertools import groupby


@dataclass
class FastaSequence:
    name: str = 'FASTA Sequence'
    seq: str = ''

    def __len__(self):
        return len(self.seq)


def fasta_iter(filename: str):
    fh = open(filename, mode='r', encoding='utf-8')
    faiter = (x[1] for x in groupby(fh, lambda line: line[0] == '>'))
    for _header in faiter:
        _header_str = _header.__next__()[1:].strip()
        _seq = ''.join(s.strip() for s in faiter.__next__())
        yield FastaSequence(_header_str, _seq)


def split_string(input_string, max_length=60):
    lines = []
    while len(input_string) > max_length:
        idx = max_length
        while idx > 0 and input_string[idx] != ' ':
            idx -= 1
        if idx == 0:
            idx = max_length
        lines.append(input_string[:idx])
        input_string = input_string[idx:].strip()
    lines.append(input_string)
    return lines
