def my_min_p1(arr)
  min = arr.first
  arr.each do |el1|
    arr.each do |el2|
      min = el2 if min > el2
    end
  end
  min
end

def my_min_p2(arr)
  min = arr.first
  arr.each do |el|
    min = el if el < min
  end
  min
end

def sub_sum_p1(arr)
  sub_arr =[]
  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      sub_arr << arr[i..j]
    end
  end
  max = arr.first
  sub_arr.each do |sub_num|
    current_sum = sub_num.inject(:+)
    max = current_sum if current_sum > max
  end
  max
end

def sub_sum_p2(list)
  curr = 0
  max = 0
  list.each do |el|
    curr += el
    max = curr if curr > max
    curr = 0 if curr < 0
  end
  max
end
