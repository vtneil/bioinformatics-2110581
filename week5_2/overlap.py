def merge_strs(str1, str2):
    merged_str = ""

    i, j = 0, 0
    overlapping_part = ""

    while i < len(str1) and j < len(str2):
        if str1[i] < str2[j]:
            merged_str += str1[i]
            i += 1

        elif str2[j] < str1[i]:
            merged_str += str2[j]
            j += 1
        else:
            overlapping_part += str1[i]
            i += 1
            j += 1

            while i < len(str1) and j < len(str2) and str1[i] == str2[j]:
                overlapping_part += str1[i]
                i += 1
                j += 1

            merged_str += overlapping_part
            overlapping_part = ""
    merged_str += str1[i:]
    merged_str += str2[j:]
    
    return len(merged_str) != len(str1) + len(str2) or len(str1) == 0 or len(str2) == 0, merged_str


def denovo(reference, *reads):
    outs = [[] for _ in range(len(reads))]
    rejected = []
    found_idx = set()

    for i, group in enumerate(reads):
        for read in group:
            idx = reference.find(read)
            if idx >= 0:
                if idx in found_idx:
                    idx = reference.rfind(read)
                    if idx in found_idx:
                        rejected.append(read)
                        continue
                found_idx.add(idx)
                outs[i].append(' ' * idx + read + '>' + str(3 - i - 1))
            else:
                rejected.append(read)

        outs[i].sort(reverse=True)

    s = ''
    for a, b in zip(*outs):
        c = ''
        for i in range(len(b)):
            if i < len(a):
                c += a[i]
            else:
                c += b[i]
        s += c
        s += '\n'
    
    return s, rejected
    

if __name__ == '__main__':
    print(merge_strs("AAAACAACTAACCCTTGCCAA", "AAACAACTAACCCTTGCCAAC"))
