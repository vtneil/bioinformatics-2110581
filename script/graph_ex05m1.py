from sys import stdin
import sys

sys.setrecursionlimit(20000)

def dfs(g, v, parent, visited):
    visited.add(v)
    for w in g[v]:
        if w not in visited:
            if dfs(g, w, v, visited):
                return True
        elif w != parent:
            return True
    return False

T = int(stdin.readline().strip())
for _ in range(T):
    N, E = map(int, stdin.readline().strip().split())
    g = {i: set() for i in range(N)}
    for _ in range(E):
        m, n = map(int, stdin.readline().strip().split())
        g[m].add(n)
        g[n].add(m)
    visited = set()
    flag = False
    for v in g:
        if v in visited:
            continue
        elif dfs(g, v, -1, visited):
            flag = True
            break
    if flag:
        print('YES')
    else:
        print('NO')
