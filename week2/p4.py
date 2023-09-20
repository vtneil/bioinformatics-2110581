from Bio.Seq import Seq, translate

s = '''
GAAGGCAGGCGGTGCGTGTAGCAATATCCGTAGCGATTGGAATCGTCGGTTCTACGTTATAGGAGAGCGACCTTTTGCCTTTCTCTAATTAG
TACCGCAGCTAGAAGGTCCAATTGTCAGCTCTTTGTGAGGCCTCACAAAGAGCTGACAATTGGACCTTCTAGCTGCGGTA
TCTGATGGCTCCGGGGGCGTCAGCTCGTTGCTTTTAACCGGACCAGTCCCTTAGAATCTACAGGGAACCATGGAACTAGTGAGA
ACGGACAGTTGTCTAGGAAGTTGAGATCTCATAGCCGCCACAAGACTACTATTTTAAGGGATGACTGACTCTATGTCTGAAGCGTGGC
AAAACGCTAAGTGATGGTAAGAGGGCAGTGGAGGCGGCTTACTGGAGTGTTTTCCACTTAACCTAGCGCACCTTCAAGGGCTGCATC
CGACACCAGTTTTACATTGAACAAGGTTTTTGTCAGTTGTCCCTTTTTGCCCGCGGTATCCATTATTATTTGCTAAAACGTCTGG
CCTAGGCTGAATGTCAGGCCGTAGGGAAATTAGTTACACTCCTCGTCATCACGAAGCCAATGACTAGGTTCCAACGTGGTGTAAGAAAACGAG
GGACTAAGACGGGGGAGGAAAATGGGCCCTAGATTAGGGAAAGGGTGGTTTATAGGTGGGGTTCGCAACTTTTATAAAAGGCTGAACGGGG
ACGGGTTGTTGCAGGTTGTAATGAAGACCATGTCTGACGAGATCATGATCTCGTCAGACATGGTCTTCATTACAACCTGCAACAACCCGT
TGGCGGATCTTAGGTCGCAGTTTCGCGTGTTGGGCGATCGGCACCGCGGAAATGAACGAACGTAGCAGGCTGACACATGTGG

'''

for e in s.strip().splitlines():
    seq = Seq(e)
    print(seq.__str__() == seq.reverse_complement().__str__())