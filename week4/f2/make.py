REF_FILE = 'reference.fastq'
READ_FILES = ['reads1.fastq', 'reads2.fastq']


with open(REF_FILE, 'r') as ref:
    ref_string = ref.readlines()[0].strip()

    reads = []
    for fname in READ_FILES:
        with open(fname, 'r') as fread:
            reads.append([e.strip() for e in fread.readlines() if e and e[0] != '>'])
    
    outs = [[] for i in range(len(READ_FILES))]
    rejected = []
    found_idx = set()
    
    print(ref_string)
    
    for i, group in enumerate(reads):
        for read in group:
            idx = ref_string.find(read)
            if idx >= 0:
                if idx in found_idx:
                    idx = ref_string.rfind(read)
                    if idx in found_idx:
                        rejected.append(read)
                        continue
                found_idx.add(idx)
                outs[i].append(' ' * idx + read + '>' + str(3 - i - 1))
            else:
                rejected.append(read)
        
        outs[i].sort(reverse=True)
    
    stacked = []
    for a, b in zip(*outs):
        c = ''
        for i in range(len(b)):
            if i < len(a):
                c += a[i]
            else:
                c += b[i]
        print(c)
        
    print('=====')
    
    for e in sorted(rejected):
        print(e)
        
    