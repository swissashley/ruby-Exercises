require_relative 'myqueue'

def max_windowed_range(array, window_size)
  current_max_range = nil
  0.upto(array.length - window_size).each do |start_idx|
    max = array[start_idx, window_size].max
    min = array[start_idx, window_size].min
    current_max_range = max - min if current_max_range.nil? || max - min > current_max_range
  end
  current_max_range
end
#n^2

def optimized_max_windowed_range(array, window_size)
  queue = MinMaxStackQueue.new

  window_size.times {queue.enqueue(array.shift)}
  p "current queue: #{queue.my_stack.store}"
  diff = queue.max - queue.min
  p "Current diff: #{diff}"

  until array.empty?
    queue.dequeue
    p "curr arr: #{array} and curr queue: #{queue.my_stack.store}"
    queue.enqueue(array.shift)

    curr_diff = queue.max - queue.min
    p "current queue: #{queue.my_stack.store} and the curr diff is : #{curr_diff}"
    diff = curr_diff if curr_diff > diff
  end
  diff
end
