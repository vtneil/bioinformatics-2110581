import itertools


class SuffixTree:
    class Node:
        def __init__(self):
            self.suffix_node = -1

    class Edge:
        def __init__(self, first_char_index, last_char_index, source_node_index, dest_node_index):
            self.first_char_index = first_char_index
            self.last_char_index = last_char_index
            self.source_node_index = source_node_index
            self.dest_node_index = dest_node_index

        @property
        def length(self):
            return self.last_char_index - self.first_char_index

    class Suffix:
        def __init__(self, source_node_index, first_char_index, last_char_index):
            self.source_node_index = source_node_index
            self.first_char_index = first_char_index
            self.last_char_index = last_char_index

        @property
        def length(self):
            return self.last_char_index - self.first_char_index

        def explicit(self):
            return self.first_char_index > self.last_char_index

        def implicit(self):
            return self.last_char_index >= self.first_char_index

    def __init__(self, string, case_insensitive=False):
        self.string = string
        self.case_insensitive = case_insensitive
        self.N = len(string) - 1
        self.nodes = [SuffixTree.Node()]
        self.edges = dict()
        self.active = SuffixTree.Suffix(0, 0, -1)
        if self.case_insensitive:
            self.string = self.string.lower()
        for i in range(len(string)):
            self._add_prefix(i)

    @property
    def suffixes(self):
        out = []
        curr_index = self.N
        for edge in sorted(self.edges.values(), key=lambda x: x.source_node_index):
            if edge.source_node_index == -1:
                continue
            top = min(curr_index, edge.last_char_index)
            out.append(self.string[edge.first_char_index:top + 1])
        return out

    def _add_prefix(self, last_char_index):
        last_parent_node = -1
        while True:
            parent_node = self.active.source_node_index
            if self.active.explicit():
                if (self.active.source_node_index, self.string[last_char_index]) in self.edges:
                    break
            else:
                e = self.edges[self.active.source_node_index, self.string[self.active.first_char_index]]
                if self.string[e.first_char_index + self.active.length + 1] == self.string[last_char_index]:
                    break
                parent_node = self._split_edge(e, self.active)

            self.nodes.append(SuffixTree.Node())
            e = SuffixTree.Edge(last_char_index, self.N, parent_node, len(self.nodes) - 1)
            self._insert_edge(e)

            if last_parent_node > 0:
                self.nodes[last_parent_node].suffix_node = parent_node
            last_parent_node = parent_node

            if self.active.source_node_index == 0:
                self.active.first_char_index += 1
            else:
                self.active.source_node_index = self.nodes[self.active.source_node_index].suffix_node
            self._canonize_suffix(self.active)
        if last_parent_node > 0:
            self.nodes[last_parent_node].suffix_node = parent_node
        self.active.last_char_index += 1
        self._canonize_suffix(self.active)

    def _insert_edge(self, edge):
        self.edges[(edge.source_node_index, self.string[edge.first_char_index])] = edge

    def _remove_edge(self, edge):
        self.edges.pop((edge.source_node_index, self.string[edge.first_char_index]))

    def _split_edge(self, edge, suffix):
        self.nodes.append(SuffixTree.Node())
        e = SuffixTree.Edge(edge.first_char_index, edge.first_char_index + suffix.length, suffix.source_node_index,
                            len(self.nodes) - 1)
        self._remove_edge(edge)
        self._insert_edge(e)
        self.nodes[e.dest_node_index].suffix_node = suffix.source_node_index  ### need to add node for each edge
        edge.first_char_index += suffix.length + 1
        edge.source_node_index = e.dest_node_index
        self._insert_edge(edge)
        return e.dest_node_index

    def _canonize_suffix(self, suffix):
        if not suffix.explicit():
            e = self.edges[suffix.source_node_index, self.string[suffix.first_char_index]]
            if e.length <= suffix.length:
                suffix.first_char_index += e.length + 1
                suffix.source_node_index = e.dest_node_index
                self._canonize_suffix(suffix)


def find_max_overlap(sequences):
    cache_st = dict()
    max_len = 0
    x, y = None, None
    result = ''

    for a, b in itertools.combinations(sequences, 2):
        comb_str = f'{a}#{b}$'
        if comb_str not in cache_st:
            cache_st[comb_str] = SuffixTree(comb_str)
        ss = cache_st[comb_str].suffixes

        for s in ss:
            if s and s[-1] != '#' and s[-1] != '$' and len(s) > max_len:
                ia, ib = a.find(s), b.find(s)
                if ia + len(s) == len(a) and ib == 0:
                    max_len, x, y = len(s), a, b
                    result = a + b[max_len:]
                elif ib + len(s) == len(b) and ia == 0:
                    max_len, x, y = len(s), a, b
                    result = b + a[max_len:]

    return x, y, result, max_len


def sequence_assembly(sequences, min_overlap: int = 1):
    assembled = set(sequences)

    while True:
        a, b, merged, overlap_len = find_max_overlap(assembled)

        if overlap_len < min_overlap:
            break

        assembled.discard(a)
        assembled.discard(b)
        assembled.add(merged)

    return sorted(assembled, key=lambda x: (-len(x), x))


# Test
sequences = ['GGCCCCCGGTGCCG', 'CGGCACCGGGGGCC', 'CGGGGGCCCTAGAG', 'CTCTAGGGCCCCCG']
assembled_seqs = sequence_assembly(sequences, 2)
for e in assembled_seqs:
    print(e)
