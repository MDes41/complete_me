class Node
  attr_accessor :val, :children

  def initialize(val, children = [])
    @val = val
    @children = children
  end
end