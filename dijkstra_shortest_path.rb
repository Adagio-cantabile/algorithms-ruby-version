# coding: utf-8
#┗|*´ﾟДﾟ｀|┛ﾖｯﾛ┏|*＿ ＿|┓ｼｯ
#using greedy algorithm to solve this problem
#before implementing greedy algorithm, it's important to make sure it's correct
#in this case, if negative edges exist, greedy algorithm is incorrect
#this algorithm doesn't do pre-processing like checking the graph is correctly made

#g for data structure of graph (array matrix), s for starting point
def dijkstra_shortest_path(g, s)
  s1 = {} #vertex counted => shortest path
  s2 = [0, 1, 2, 3, 4]
  g.each do |row| #don't count nil
    row.map! {|edge| edge ||= 99999999}
  end
  current = s
  length = 0
  while s2.uniq.size != 1
    s1.merge!({current => length})
    s2[current] = 99999999
    g = g.each {|row| row[current] = 99999999 }
    current, min_edge = get_min_edge(g, current, s2)
    length += min_edge
  end
  return s1
end

#select shortest edge among s2
def get_min_edge(g, current, s2)
  g[current][current] = 99999999 #this vertex self shouldn't be counted
  min_edge =  g[current].min
  current = g[current].index(min_edge)
  return current, min_edge
end

#     A    B    C    D    E    F
g = [[0  , 7  , 9  , nil, nil, 14 ], #A
     [7  , 0  , 10 , 15 , nil, nil], #B
     [9  , 10 , 0  , 11 , nil, 2  ], #C
     [nil, 15 , 11 , 0  , 6  , nil], #D
     [nil, nil, nil, 6  , 0  , 9  ], #E
     [14 , nil, 2  , nil, 9  , 0  ]] #F
p "the output format will be {vertex => shortest path}"
p "＼（○＾ω＾○）／ the result is:" + dijkstra_shortest_path(g, 1).inspect # => {1=>0, 0=>7, 2=>16, 5=>18, 4=>27, 3=>33}
