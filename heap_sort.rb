# coding: utf-8
#all cases are O(nlgn)
#heap is reconstructed after taking the root node each time
#＼（○＾ω＾○）／

def heap_sort(arr)
  p 'original arr is:' + arr.inspect
  arr = build_heap(arr)
  p 'after build heap, arr is:' + arr.inspect
  i = arr.size - 1
  while i > 0
    arr[i], arr[0] = arr[0], arr[i]
    i -= 1
    arr = max_heapify(arr, 0, i)
  end
  return arr
end

def build_heap(arr)
  i = arr.size/2 - 1
  while i >= 0 #heapify from buttom until root
    arr = max_heapify(arr, i, arr.size - 1)
    i -= 1
  end
  return arr
end

def max_heapify(arr, i, j) #heapify subarray arr[i]..arr[j]
  return arr if 2 * i + 1 > j
  if 2 * i + 2 > j
    k = 2 * i + 1
  elsif arr[2*i+1] > arr[2*i+2]
    k = 2 * i + 1
  else
    k = 2 * i + 2
  end
  if arr[i] < arr[k]
    arr[i], arr[k] = arr[k], arr[i]
    arr = max_heapify(arr, k, j) #max_heapify recursively called
  end
  return arr
end

p "＼（○＾ω＾○）／ the result is:" + heap_sort([3,1,5,8,2,4,8,0,9,11]).inspect # => [0, 1, 2, 3, 4, 5, 8, 8, 9, 11]

#things learned:
#1. (╯°O°)Everytime calling build_heap or max_heapify, arr must be returned and assigned to old arr
#2. （╯'-')╯In max_heapify method, the if/else part is critical
