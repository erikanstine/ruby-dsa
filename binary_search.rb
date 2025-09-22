def b_search(nums, target)
  l = 0
  r = nums.length - 1
  while l <= r && r < nums.length
    mid = (l + r) / 2
    if nums[mid] == target
      return mid
    elsif nums[mid] > target
      r = mid - 1
    else
      l = mid + 1
    end
  end
end
