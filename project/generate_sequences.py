import random
import time
import sys


def generate_string(length: int, characters):
    random.seed(time.time())
    return ''.join(random.choice(characters) for _ in range(length))


if __name__ == '__main__':
    SETS = [1, 2]
    MAX_STRING_LENGTH = 25_600
    STEP = 1024
    CHARACTER_POOL = 'ATCG'

    for _set in SETS:
        for i in range(STEP, MAX_STRING_LENGTH + 1, STEP):
            SEQ_NAME = f'Random DNA {_set} Length {i}'
            FILENAME = f'seq/set{_set}/random_dna_{i}.fasta'

            out = generate_string(i, CHARACTER_POOL)

            with open(FILENAME, mode='w') as f:
                f.write(f'>{SEQ_NAME}')
                f.write('\n')
                f.write(out)
                f.flush()

    print("Generate Done")
