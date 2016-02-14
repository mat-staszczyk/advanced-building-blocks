def bubble_sort(nums_array)
  arr_len = nums_array.size - 1
  sorted = nums_array.clone
  ready = false
  until ready do
    i = 0
    ready = true
    while i < arr_len do
      if sorted[i] > sorted[i+1]
        
        ready = fasle        
      end 
      i += 1
    end
  end
end
