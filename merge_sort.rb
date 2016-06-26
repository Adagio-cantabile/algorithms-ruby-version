# coding: utf-8
#(๑•̀ㅂ•́)و✧--
#O(nlgn)
#merge_sort method returns a sorted array
#merge method merges two arrays into one array

def merge_sort(arr)
  return arr if arr.size <= 1
  mid = (arr.size - 1)/2
  left = merge_sort(arr[0..mid])
  right = merge_sort(arr[(mid+1)...arr.size])
  merge(left, right)
end

def merge(left, right)
  result = []
  i = 0
  j = 0
  while i < left.size && j< right.size
    if left[i] < right[j]
      result << left[i]
      i += 1 
    else
      result << right[j]
      j += 1
    end
  end
  #order of comparision and incresement is important here (╯>д<)╯⁽˙³
  
  #if left or right side is not sorted
  if i < left.size
    result = result.concat(left[i...left.size])
  else
    result = result.concat(right[j...right.size])
  end
  return result
end

p merge_sort([4,7,2,0,1,5,8,2,6,8,3,4]) # => [0, 1, 2, 2, 3, 4, 4, 5, 6, 7, 8, 8]

#things learnt:
#1.（╯'-')╯（┻) boundary conditions are very important
#2. ┬—┬ノ('-'ノarr.concat() method will not change the arry itself
#3. (╯°O°)╯（┻) inserting 顔文字 in comments are fun!
