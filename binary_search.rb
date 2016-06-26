#input array must be sorted
#best case is O(1), worst/average case is O(logn)
#better than linear search in its best case
#but it takes extra time for the array to be sorted

#only when min > max (element was crossed)
#it can be sure we can't find the element

def binary_search(arr, key)
  min = 0
  max = arr.size - 1
  until min > max
    mid = (min + max)/2
    if arr[mid] > key
      max = mid -1
    elsif arr[mid] < key
      min = mid + 1
    else
      return mid
    end
  end
  return -1
end

arr = [23, 45, 67, 89, 123, 568]
p binary_search(arr, 89) # => 3
p binary_search(arr, 23) # => 0
p binary_search(arr, 88) # => -1

#things to pay attention:
#arr.size is alias to arr.length, but arr.size can take one parameter
#do seperate operator and the number
