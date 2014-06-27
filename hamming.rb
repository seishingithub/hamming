require_relative "testing_library"

def hamming(strand_1, strand_2)

  strands_merged = strand_1.split(//).zip(strand_2.split(//)).flatten

  if strands_merged[-1] == nil
    strands_merged.pop(2)
  end

  dna_pairs = []
  while strands_merged.size > 0
    dna_pairs << strands_merged.slice!(0, 2)
  end

  counter = 0
  dna_pairs.select do |nucleotide|
    if nucleotide[0] != nucleotide[1]
      counter += 1
    end
  end
  p counter
end

check("Hamming distance between identical strands",
      hamming("A", "A") == 0)

check("Hamming distance for single nucleotide strand",
      hamming("A", "G") == 1)

check("Hamming distance between small strands",
      hamming("AG", "CT") == 2)

check("Hamming distance between two other small strands",
      hamming("AT", "CT") == 1)

check("Hamming distance in longer strands",
      hamming("GGACG", "GGTCG") == 1)

check("Ignoring extra length in the first strand when it's longer",
      hamming("AAAG", "AAA") == 0)

check("Ignoring extra length in the second strand when it's longer",
      hamming("AAA", "AAAG") == 0)