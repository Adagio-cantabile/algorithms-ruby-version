# coding: utf-8
#╰(*°▽°*)╯
#dynamic programming

#max_weight is the maximum weight a knapsack can contain, should be integer
#v for value array, w for corresponding weight array
def knapsack(max_weight, v, w)
  return "input error" if v.size != w.size or !max_weight.is_a? Integer
  n = v.size
  c = []
  (n + 1).times do
    c << []
  end
  #initialize matrix for dynamic programming
  #row for items, columns for weight
  for i in 0..max_weight do #when allowed wiehgt is 0
    c[0][i] = 0
  end

  for i in 1..n do #i for current total items
    c[i][0] = 0
    for j in 1..max_weight do #j for current weight
      if w[i-1] <= j
        if c[i-1][j-w[i-1]] + v[i-1] >= c[i-1][j] #compare value with or without current value
          c[i][j] = c[i-1][j-w[i-1]] + v[i-1]
        else
          c[i][j] = c[i-1][j]
        end
      else
        c[i][j] = c[i-1][j]
      end
    end
  end
  return c[n][max_weight]
end

p  "＼（○＾ω＾○）／ the result is:" + knapsack(10, [10, 40, 30, 50], [5, 4, 6, 3]).to_s # => 90
