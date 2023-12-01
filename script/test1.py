from sys import stdin
from collections import deque, defaultdict

Graph = defaultdict

G = defaultdict(set)

G[1].add(2)
G[1].add(3)
G[2] = {4, 5}
G[3] = {6, 7}
G[4] = {8, 9}
G[7] = {6}
G[9] = {6}

def dfs(g: Graph, start):
    visited = set()
    stack = deque([start])
    while stack:
        v = stack.pop()
        if v not in visited:
            print(v, end=' ')
            visited.add(v)
            stack.extend(g[v] - visited)

def bfs(g: Graph, start):
    visited = set()
    queue = deque([start])
    while queue:
        v = queue.popleft()
        if v not in visited:
            print(v, end=' ')
            visited.add(v)
            queue.extend(g[v] - visited)

def tsort(g: Graph):
    in_degs = defaultdict(int)
    for v in g:
        for w in g[v]:
            in_degs[w] += 1
    stack = deque(v for v in g if in_degs[v] == 0)
    out = []
    while stack:
        v = stack.pop()
        out.append(v)
        for w in g[v]:
            in_degs[w] -= 1
            if in_degs[w] == 0:
                stack.append(w)
    
    if len(out) == len(g):
        return out
    return None
        

print(G)
print(tsort(G))
# bfs(G, 1)