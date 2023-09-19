string = "ATAGTGCCGTGGCCGCGGGACGGTACGGAGCCTATCCCCTCGCCAGCCGATTCTGCCACCCCGACGCACTGGCCGGGAGCCGTCGCTCGGGCGATGGCCG"
longest_sequence = ""
sequence = ""
prev_char = ""

for char in string:
    if char == prev_char:
        sequence += char
    else:
        if len(sequence) > len(longest_sequence):
            longest_sequence = sequence
        sequence = char

    prev_char = char

if len(sequence) > len(longest_sequence):
    longest_sequence = sequence

print("Longest repetitive sequence:", longest_sequence)