def bwt(word: str):
    word += '$'
    n = len(word)
    return ''.join(e[-1] for e in sorted(word[i:] + word[:i] for i in range(n)))


def ibwt_naive(compressed: str):
    n = len(compressed)
    t = sorted(compressed)
    for i in range(n - 1):
        t = sorted(compressed[i] + t[i] for i in range(n))
    return t[0][1:]


if __name__ == '__main__':
    text = 'final'
    x = bwt(text)
    print(x)

    print(ibwt_naive('xxyy$'))
