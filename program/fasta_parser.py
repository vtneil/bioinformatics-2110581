from itertools import groupby


def fasta_iter(filename):
    fh = open(filename)
    faiter = (x[1] for x in groupby(fh, lambda line: line[0] == '>'))
    for _header in faiter:
        _header_str = _header.__next__()[1:].strip()
        _seq = ''.join(s.strip() for s in faiter.__next__())
        yield _header_str, _seq
