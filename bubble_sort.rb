def bubble_sort(nums_array)
  arr_len = nums_array.size - 1
  sorted = nums_array.clone
  ready = false
  until ready do
    i = 0
    ready = true
    while i < arr_len do
      if sorted[i] > sorted[i+1]
        sorted[i], sorted[i+1] = sorted[i+1], sorted[i]
        ready = false        
      end 
      i += 1
    end
  end
  sorted
end

def bubble_sort_by(array)
  arr_len = array.size - 1
  sorted = array.clone
  ready = false
  until ready do
    i = 0
    ready = true
    while i < arr_len do
      if yield(sorted[i], sorted[i+1]) > 0
        sorted[i], sorted[i+1] = sorted[i+1], sorted[i]
        ready = false
      end
      i += 1
    end
  end
  sorted
end
