from heapq import *

def prim(g, start):
    visited = set()
    mst = {}
    heap = [(0, start, None)]
    
    while heap:
        _, v, u = heappop(heap)
        if v not in visited:
            visited.add(v)
            if u is not None:
                mst[v] = u
            for w, wt in g[v].items():
                if w not in visited:
                    heappush(heap, (wt, w, v))
    return mst

graph = {
    1: {2: 2, 3: 3},
    2: {1: 2, 3: 1, 4: 1},
    3: {1: 3, 2: 1, 4: 1},
    4: {2: 1, 3: 1}
}
t1 = prim(graph, next(iter(graph)))
print(t1)

price = sum(graph[v][w] for v, w in t1.items())
print(price)
