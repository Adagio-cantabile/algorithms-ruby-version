# coding: utf-8
#average case O(nlgn)
#worst case O(n^2), when the array is ordered
#choose the pivot wisely can prevent worst case happenging
#first time pivot is the first element
#let's try |*≧Д≦|>ダンシング♪＼|*≧Д≦|>ダンシング♪

def quick_sort(arr, left = 0, right = nil)
  right ||= arr.size - 1
  return arr if left >= right
  pivot = partition(arr, left, right)
  quick_sort(arr, left, pivot - 1) #sort left side of pivot
  quick_sort(arr, pivot + 1, right) #sort right side of pivot
end

def partition(arr, left, right)
  i, j = left + 1, right
  while true
    i+=1 while arr[i] <= arr[left] and i < right
    j-=1 while arr[j] > arr[left] and j > left
    break if i >= j
    arr[i], arr[j] = arr[j], arr[i]
  end
  arr[left], arr[j] = arr[j], arr[left]
  return j
end

p quick_sort([3,1,5,8,2,4,8,0,9,11]) # => [0, 1, 2, 3, 4, 5, 8, 8, 9, 11]
p quick_sort([34,65,12,44,12,62,36,13,97,21]) # => [12, 12, 13, 21, 34, 36, 44, 62, 65, 97]

# Things learnt:
#（;≧皿≦）。゜°。ううううぅぅぅ
# At first, I was quite confused how partition works
# partition method takes a subarray, choose the first element as the base element
# then rearrange the subarray to put the base element into right place, and use it as a pivot
# This sorting process all happens in divide phase
