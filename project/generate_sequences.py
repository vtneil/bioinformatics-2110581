import random
import time
import sys


def generate_string(length: int, characters):
    random.seed(time.time())
    return ''.join(random.choice(characters) for _ in range(length))


if __name__ == '__main__':
    SET = 2
    MAX_STRING_LENGTH = 51_200
    STEP = 512
    CHARACTER_POOL = 'ATCG'

    for i in range(STEP, MAX_STRING_LENGTH + 1, STEP):
        SEQ_NAME = f'Random DNA {SET} Length {i}'
        FILENAME = f'seq/set{SET}/random_dna_{i}.fasta'

        out = generate_string(i, CHARACTER_POOL)

        with open(FILENAME, mode='w') as f:
            f.write(f'>{SEQ_NAME}')
            f.write('\n')
            f.write(out)
            f.flush()

    print("Generate Done")
