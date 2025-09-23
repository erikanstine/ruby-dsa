# typed: strict

require 'sorbet-runtime'

class Algo
  extend T::Sig

  sig { params(strs: T::Array[String]).returns(String) }
  def encode(strs)
    res = ''
    strs.each do |s|
      res += "#{s.size}##{s}"
    end
    res
  end

  sig { params(s: String).returns(T::Array[String]) }
  def decode(s)
    res = []
    i = 0
    while i < s.size
      j = i
      j += 1 while s[j] != '#'
      length = s[i...j].to_i
      i = j + 1
      j = i + length
      res.append(s[i...j])
      i = j
    end
    res
  end
end
