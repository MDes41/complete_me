class NodeContainer
  attr_reader :node_container

  def initialize
    @node_container = []
  end

  def <<(arg)
    return [] if arg.class != Node
    node_container << arg
    self
  end

  def first
    node_container.first
  end

  def exists?(letter)
    node_container.any? do |node|
      node.word == letter
    end
  end

  def count
    node_container.count
  end

  def current_node(letter)
    node_container.find do |node|
      node == letter
    end
  end

end