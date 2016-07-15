# coding: utf-8
#greedy algorithm
#＼（○＾ω＾○）／

def kruskal_minimum_spanning_tree(n, edges)
  v_set = []
  results = []
  for i in 0...n do
    v_set[i] = [i]
  end
  edges = edges.sort
  edges.each do |edge|
    if v_set[edge.from] != v_set[edge.to]
      p "from set:" + v_set[edge.from].inspect
      p "to set:" + v_set[edge.to].inspect
      results << edge
      v_set = union_set(v_set, edge.from, edge.to)
      p "from set turns:" + v_set[edge.from].inspect
      p "v_set turns to:" + v_set.inspect
    end
  end
  results
end

def union_set(v_set, from, to)
  from_set = v_set[from]
  v_set.map! do |set|
    if set == from_set
      set << v_set[to]
      set.flatten.uniq.sort
    else
      set
    end
  end
  v_set[to] = v_set[from]
  v_set
end

Edge = Struct.new(:from, :to, :weight) do
  def <=> rhs
    self.weight <=> rhs.weight
  end
end

edges = [
  Edge.new(0, 1, 1), Edge.new(1, 2, 2), Edge.new(2, 3, 9),
  Edge.new(3, 0, 7), Edge.new(0, 2, 2), Edge.new(1, 3, 6)
]

p kruskal_minimum_spanning_tree(4, edges)
