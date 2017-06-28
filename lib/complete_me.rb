class CompleteMe

  def initialize
    @dic = []
  end

  def insert(word)
    @dic = word.cars do |letter|
      next_node = Node.new(letter)
    end
  end

  def count
    @dic.length
  end

  def suggest(word)
    node_dic = @dic.dub
    word.chars.each do |letter|
      node = node_dic.select do |node| 
        node == letter
      end
      if node == false
        #make a new node
      else
        node_dic = node
      end
    end
  end
end

class Node
  def initialize(data, parent_node = nil, sub_nodes = [])
    @data = data
    @parent_node = parent_node
    @sub_nodes = sub_nodes
  end
end