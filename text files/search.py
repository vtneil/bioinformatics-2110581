i = 1
q = 'GCAGCCCGTCTTCACGGTTGGAAGGGGGGGCCCGGCACCGCGCGCGGGTGATTCCTCCGGGGGCCCCCGG'
s = '''
>read_001
CCGGGGGCCC
>read_002
CGCGCGGGTG
>read_003
ACCGCGCGCG
>read_004
CGGGTGATTC
>read_005
TGATTCCTCC
>read_006
GGGCCCCCGG
>read_007
GGCCCGGCAC
>read_008
CACGGTTGGA
>read_009
GCAGCCCGTC
>read_010
GAAGGGGGGG
>read_011
CCCGTCTTCA
>read_012
CGGCACCGCG
>read_013
GGGGGGCCCG
>read_014
TCCTCCGGGG
>read_015
TCTTCACGGT
>read_016
GTTGGAAGGG
GTTGGAAGGG
'''.strip().splitlines()
    
for line in s:
    if line and line[0] != '>':
        print(f'read_{i:03} at {q.find(line.strip())}')
        i += 1
