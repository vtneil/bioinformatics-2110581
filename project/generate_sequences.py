import random
import time
import sys


def generate_string(length: int, characters, salt=1234):
    random.seed(time.time() + hash(length) + hash(salt))
    return ''.join(random.choice(characters) for _ in range(length))


if __name__ == '__main__':
    SETS = [5, 6]
    MAX_STRING_LENGTH = 102_400
    STEP = 8192
    CHARACTER_POOL = 'ATCG'

    for _set in SETS:
        for i in range(STEP, MAX_STRING_LENGTH + 1, STEP):
            SEQ_NAME = f'Random DNA {_set} Length {i}'
            FILENAME = f'seq/set{_set}/random_dna_{i}.fasta'

            out = generate_string(i, CHARACTER_POOL, _set * 9998)

            with open(FILENAME, mode='w', encoding='utf-8') as f:
                f.write(f'>{SEQ_NAME}')
                f.write('\n')
                f.write(out)
                f.flush()

    print("Generate Done")
