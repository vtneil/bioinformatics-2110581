from collections import deque, defaultdict

def dfs(start, g: defaultdict, visited: set):
    stack = deque([start])
    out = deque()
    while stack:
        v = stack.pop()
        if v not in visited:
            visited.add(v)
            out.append(v)
            stack.extend(g[v] - visited)
    return out

def multi_dfs(g: defaultdict):
    visited = set()
    out = deque()
    for u in g:
        if u not in visited:
            out.extend(dfs(u, g, visited))
    return out

def transpose(g: defaultdict):
    h = defaultdict(set)
    for v in g:
        for w in g[v]:
            h[w].add(v)
    return h

def scc(g: defaultdict):
    h = transpose(g)
    stack = multi_dfs(g)
    visited = set()
    scc_list = []
    print(stack)
    
    while stack:
        v = stack.pop()
        if v not in visited:
            scc_list.append(dfs(v, h, visited))
    return scc_list

G = defaultdict(set)
G[1] = {2, 4}
G[2] = {3}
G[3] = {1}
G[4] = {5}
G[5] = {6}
G[6] = {5, 7}
G[7] = {4}

print(G)
for e in scc(G):
    print(' '.join(map(str, e)))