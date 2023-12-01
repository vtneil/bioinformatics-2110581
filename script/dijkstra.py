from heapq import *
from collections import defaultdict

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
    return dict(distances)

graph = {
    'A': {'B': 1, 'C': 4},
    'B': {'A': 1, 'C': 2, 'D': 5},
    'C': {'A': 4, 'B': 2, 'D': 1},
    'D': {'B': 5, 'C': 1},
}

G = defaultdict(str, graph)
print(dijkstra(G, 'A'))
