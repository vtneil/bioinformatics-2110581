from collections import defaultdict
from sys import stdin
from heapq import *

input = stdin.readline

def dijkstra(g: defaultdict, start):
    distances = defaultdict(lambda: float('inf'))
    distances[start] = 0
    heap = [(0, start)]
    while heap:
        d, v = heappop(heap)
        if d <= distances[v]:
            for w, wt in g[v].items():
                dx = d + wt
                if dx < distances[w]:
                    distances[w] = dx
                    heappush(heap, (dx, w))
    return distances

if __name__ == '__main__':
    G = defaultdict(dict)
    n, e, k = map(int, input().split())
    for _ in range(e):
        a, b = map(int, input().split())
        G[a][b] = 1
        G[b][a] = 1

    dist = dijkstra(G, 0)
    print(sum(1 for _, d in dist.items() if d == k))
