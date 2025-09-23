# typed: true
# frozen_string_literal: true

# Algo wrapper for typing
class Algo
  extend T::Sig

  sig { params(nums: T::Array[Integer], target: Integer).returns(T::Array[Integer]) }
  def two_sum(nums, target)
    h = {}
    nums.each_with_index do |n, i|
      needed = target - n
      return [h[needed], i] if h.key?(needed)

      h[n] = i
    end
    [-1, -1]
  end
end
