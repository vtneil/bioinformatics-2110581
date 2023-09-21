from nussinov import *


def main():
    with open('sequence.in', mode='r') as f:
        seqs = [e.strip() for e in f.readlines() if e.strip()]

    outs = [f'>{seq.split()[0]}\n{seq.split()[1]}\n' + nussinov(seq.split()[1]) + '\n' for seq in seqs]
    
    # for out in outs:
    #     print(out)

    with open('sequence.out', mode='w') as f:
        f.writelines(outs)
        
    print(f'Finished {len(outs)} jobs.')


if __name__ == '__main__':
    main()
