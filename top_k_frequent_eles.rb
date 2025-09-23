# typed: strict

require 'sorbet-runtime'

class Algo
  extend T::Sig

  sig { params(nums: T::Array[Integer], k: Integer).returns(T::Array[Integer]) }
  def top_k_freq(nums, k)
    counts = Hash.new(0)
    nums.each { |n| counts[n] += 1 }

    freq = Array.new(nums.size + 1) { [] }
    counts.each { |n, f| freq[f] << n }

    res = []
    (freq.size - 1).downto(1) do |i|
      freq[i].each do |n|
        res << n
        return res if res.size == k
      end
    end
    res
  end
end
