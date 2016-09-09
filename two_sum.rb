def bad_two_sum?(arr, target)
  0.upto(arr.length - 2).each do |i|
    (i + 1).upto(arr.length - 1).each do |j|
      return true if arr[i] + arr[j] == target
    end
  end
  false
end

def okay_two_sum?(arr, target)
  # n*logn
  arr.sort!

  mid = target / 2
  start_idx = 0

  # n
  arr.each_with_index do |el, i|
    if el > mid
      start_idx = i
      break
    end
  end

  # n
  right_arr = arr.drop(start_idx)
  left_arr = arr.take(start_idx)

  # n
  until right_arr.empty? || left_arr.empty?
    curr_sum = right_arr.first + left_arr.last
    return true if curr_sum == target
    if curr_sum > target
      left_arr.pop
    else
      right_arr.shift
    end
  end
  false

end

def good_two_sum?(arr, target)
  hash_map = Hash.new {0}
  arr.each do |el|
    # hash[element] = diff
    hash_map[target - el] = el unless target - el == el
  end
  arr.each do |el|
    return true if hash_map.has_key?(el)
  end
  false
end
