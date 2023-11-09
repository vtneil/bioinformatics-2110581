from Score import Score, Profile, MostProbableFromProfile


def greedy_motif_search(DNA, k, t):
    best_motifs = [0] * len(DNA)
    motifs = [0] * len(DNA)
    for j in range(0, len(DNA[0]) - k):
        motifs[0] = j
        for i in range(1, t):
            profile = Profile(motifs, DNA, k)
            motifs[i] = MostProbableFromProfile(DNA[i], profile, k)
        if Score(motifs, DNA, k) > Score(best_motifs, DNA, k):
            best_motifs = motifs
    return Score(best_motifs, DNA, k), best_motifs

if __name__ == '__main__':
    DNA = (
        'tagtgg',
        'cgcgac',
        'aacatc',
        'tagatt',
        'gaaatg',
        'ttctta',
        'ctacct'
    )

    Score, S = greedy_motif_search(DNA, 3, len(DNA))
    print(Score)
    for i, Sekwencja in enumerate(DNA):
        print(Sekwencja[S[i]:S[i]+3])
