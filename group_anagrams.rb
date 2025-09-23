def parse_word(word)
  lmap = [0] * 26

  word.each_char do |char|
    idx = char.ord - 'a'.ord
    lmap[idx] += 1
  end
  lmap
end

# Group Anagrams, LC 49
def group_anagrams(strs)
  res = {}
  for s in strs do
    fingerprint = parse_word(s)
    if res.key?(fingerprint)
      res[fingerprint].append(s)
    else
      res[fingerprint] = [s]
    end
  end
  output = []
  res.each do |_k, v|
    output.append(v)
  end
  output
end
