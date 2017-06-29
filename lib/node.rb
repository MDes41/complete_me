class Node
  attr_accessor :val, :children, :leaf

  def initialize(val, children = [])
    @val = val
    @children = children
    @leaf = false
  end
end