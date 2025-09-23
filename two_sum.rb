# typed: true
# frozen_string_literal: true

def two_sum(nums, target)
  h = {}
  nums.each_with_index do |n, i|
    needed = target - n
    return [h[needed], i] if h.key?(needed)

    h[n] = i
  end
  nil
end
