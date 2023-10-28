if __name__ == '__main__':
    N = 106496

    BYTES = N + N + (N * 8) ** 2
    print(f'{BYTES}\tB')
    print(f'{BYTES / 1024}\tKiB')
    print(f'{BYTES / 1024 / 1024}\tMiB')
    print(f'{BYTES / 1024 / 1024 / 1024}\tGiB')
    print(f'{BYTES / 1024 / 1024 / 1024 / 1024}\tTiB')
