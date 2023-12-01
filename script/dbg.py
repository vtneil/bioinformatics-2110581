from collections import defaultdict


def deBruijn(k, text):
    edges = defaultdict(list)
    for i in range(len(text) - k + 1):
        kmer = text[i:i + k]
        prefix = kmer[:-1]
        suffix = kmer[1:]
        edges[prefix].append(suffix)
    return edges


def format_output(graph):
    sorted_keys = sorted(graph.keys())
    for key in sorted_keys:
        if graph[key]:
            yield key + " -> " + ",".join(sorted(graph[key]))


# Sample dataset
k = 4
text = """
CACTAACTCACTG
""".strip()

graph = deBruijn(k, text)
with open('out', mode='w') as f:
    for line in format_output(graph):
        print(line)
        f.write(line)
